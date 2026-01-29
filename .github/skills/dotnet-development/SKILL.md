---
name: dotnet-development
description: .NET coding standards and conventions including project structure, dependency injection, and best practices. Use when working with .NET projects, ASP.NET Core, or when the user asks about .NET architecture, dependency injection, async patterns, or project organization.
metadata:
  author: devbyray
  version: "1.0"
  platform: "dotnet"
  framework: "aspnet-core"
  depends-on: "csharp-standards"
---

# .NET Development Standards

Apply these standards when developing .NET applications. For C# language-specific standards, also refer to the csharp-standards skill.

## Prerequisites

This skill extends C# coding standards. Follow all C# naming and formatting conventions unless specifically overridden here.

## Project Structure

### 1. Organization by Feature

Organize code by feature or module:

```
MyApp/
├── MyApp.Api/              # Web API project
│   ├── Controllers/
│   ├── Middleware/
│   └── Program.cs
├── MyApp.Application/      # Application layer
│   ├── Users/
│   │   ├── Commands/
│   │   ├── Queries/
│   │   └── UserService.cs
│   └── Orders/
│       ├── Commands/
│       ├── Queries/
│       └── OrderService.cs
├── MyApp.Domain/           # Domain models
│   ├── Users/
│   │   └── User.cs
│   └── Orders/
│       └── Order.cs
├── MyApp.Infrastructure/   # Data access, external services
│   ├── Persistence/
│   └── Services/
└── MyApp.Tests/           # Tests
    ├── Unit/
    └── Integration/
```

### 2. Solution Folders

Use solution folders to mirror logical structure:

```
Solution 'MyApp'
├── src/
│   ├── MyApp.Api
│   ├── MyApp.Application
│   ├── MyApp.Domain
│   └── MyApp.Infrastructure
├── tests/
│   ├── MyApp.Tests.Unit
│   └── MyApp.Tests.Integration
└── docs/
    └── README.md
```

### 3. Naming Conventions

- **Projects**: PascalCase - `MyApp.Application`
- **Namespaces**: PascalCase - `MyApp.Application.Users`
- **Folders**: PascalCase - `Controllers`, `Services`

## Using Directives

### 4. Using Directives Organization

Place using directives outside the namespace and sort alphabetically:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MyApp.Application.Users;
using MyApp.Domain.Users;

namespace MyApp.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        // Implementation
    }
}
```

## Dependency Injection

### 5. Constructor Injection

Prefer constructor injection for dependencies:

```csharp
public class UserService : IUserService
{
    private readonly IUserRepository _repository;
    private readonly ILogger<UserService> _logger;
    private readonly IEmailService _emailService;

    public UserService(
        IUserRepository repository,
        ILogger<UserService> logger,
        IEmailService emailService)
    {
        _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _emailService = emailService ?? throw new ArgumentNullException(nameof(emailService));
    }

    public async Task<User> CreateUserAsync(User user)
    {
        _logger.LogInformation("Creating user {Email}", user.Email);
        
        var createdUser = await _repository.AddAsync(user);
        await _emailService.SendWelcomeEmailAsync(user.Email);
        
        return createdUser;
    }
}
```

### 6. Service Registration

Register services in `Program.cs` (or `Startup.cs` for older projects):

```csharp
var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Register application services
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IEmailService, EmailService>();

// Add DbContext
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Add logging
builder.Services.AddLogging(config =>
{
    config.AddConsole();
    config.AddDebug();
});

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();
```

## Async/Await Patterns

### 7. Async Methods

Always use async/await for I/O operations:

```csharp
public class OrderService : IOrderService
{
    private readonly IOrderRepository _repository;
    private readonly IPaymentService _paymentService;

    public OrderService(IOrderRepository repository, IPaymentService paymentService)
    {
        _repository = repository;
        _paymentService = paymentService;
    }

    public async Task<Order> ProcessOrderAsync(Order order)
    {
        // Validate order
        ValidateOrder(order);

        // Process payment
        var paymentResult = await _paymentService.ProcessPaymentAsync(order.PaymentInfo);
        
        if (!paymentResult.Success)
        {
            throw new PaymentFailedException(paymentResult.Message);
        }

        // Save order
        order.Status = OrderStatus.Paid;
        await _repository.UpdateAsync(order);

        return order;
    }

    private void ValidateOrder(Order order)
    {
        if (order == null)
        {
            throw new ArgumentNullException(nameof(order));
        }

        if (order.Items.Count == 0)
        {
            throw new ValidationException("Order must contain at least one item.");
        }
    }
}
```

### 8. Cancellation Tokens

Support cancellation in async methods:

```csharp
public async Task<List<User>> GetActiveUsersAsync(CancellationToken cancellationToken = default)
{
    return await _dbContext.Users
        .Where(u => u.IsActive)
        .ToListAsync(cancellationToken);
}

public async Task<User> GetUserByIdAsync(int id, CancellationToken cancellationToken = default)
{
    var user = await _dbContext.Users
        .FirstOrDefaultAsync(u => u.Id == id, cancellationToken);
    
    if (user == null)
    {
        throw new NotFoundException($"User with ID {id} not found.");
    }
    
    return user;
}
```

## Configuration

### 9. Strongly-Typed Configuration

Use strongly-typed configuration:

```csharp
// appsettings.json
{
  "EmailSettings": {
    "SmtpServer": "smtp.example.com",
    "Port": 587,
    "FromAddress": "noreply@example.com"
  }
}
```

```csharp
// Configuration class
public class EmailSettings
{
    public string SmtpServer { get; set; }
    public int Port { get; set; }
    public string FromAddress { get; set; }
}

// Program.cs
builder.Services.Configure<EmailSettings>(
    builder.Configuration.GetSection("EmailSettings"));

// Usage in service
public class EmailService : IEmailService
{
    private readonly EmailSettings _settings;

    public EmailService(IOptions<EmailSettings> settings)
    {
        _settings = settings.Value;
    }

    public async Task SendEmailAsync(string to, string subject, string body)
    {
        // Use _settings.SmtpServer, _settings.Port, etc.
    }
}
```

## Exception Handling

### 10. Global Exception Handling

Use middleware for global exception handling:

```csharp
public class ExceptionHandlingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<ExceptionHandlingMiddleware> _logger;

    public ExceptionHandlingMiddleware(
        RequestDelegate next,
        ILogger<ExceptionHandlingMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "An unhandled exception occurred.");
            await HandleExceptionAsync(context, ex);
        }
    }

    private static Task HandleExceptionAsync(HttpContext context, Exception exception)
    {
        var statusCode = exception switch
        {
            NotFoundException => StatusCodes.Status404NotFound,
            ValidationException => StatusCodes.Status400BadRequest,
            UnauthorizedException => StatusCodes.Status401Unauthorized,
            _ => StatusCodes.Status500InternalServerError
        };

        context.Response.ContentType = "application/json";
        context.Response.StatusCode = statusCode;

        var response = new
        {
            error = exception.Message,
            statusCode
        };

        return context.Response.WriteAsJsonAsync(response);
    }
}

// Register in Program.cs
app.UseMiddleware<ExceptionHandlingMiddleware>();
```

## Entity Framework Core

### 11. DbContext Configuration

```csharp
public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<User> Users { get; set; }
    public DbSet<Order> Orders { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Email).IsRequired().HasMaxLength(255);
            entity.HasIndex(e => e.Email).IsUnique();
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.HasOne(e => e.User)
                .WithMany(u => u.Orders)
                .HasForeignKey(e => e.UserId);
        });
    }
}
```

## Complete API Controller Example

```csharp
using Microsoft.AspNetCore.Mvc;
using MyApp.Application.Users;
using MyApp.Domain.Users;

namespace MyApp.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly ILogger<UsersController> _logger;

        public UsersController(IUserService userService, ILogger<UsersController> logger)
        {
            _userService = userService;
            _logger = logger;
        }

        /// <summary>
        /// Gets all users.
        /// </summary>
        [HttpGet]
        [ProducesResponseType(typeof(List<User>), StatusCodes.Status200OK)]
        public async Task<ActionResult<List<User>>> GetUsers(CancellationToken cancellationToken)
        {
            var users = await _userService.GetAllUsersAsync(cancellationToken);
            return Ok(users);
        }

        /// <summary>
        /// Gets a user by ID.
        /// </summary>
        [HttpGet("{id}")]
        [ProducesResponseType(typeof(User), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<User>> GetUser(int id, CancellationToken cancellationToken)
        {
            var user = await _userService.GetUserByIdAsync(id, cancellationToken);
            return Ok(user);
        }

        /// <summary>
        /// Creates a new user.
        /// </summary>
        [HttpPost]
        [ProducesResponseType(typeof(User), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<User>> CreateUser(
            [FromBody] CreateUserRequest request,
            CancellationToken cancellationToken)
        {
            var user = await _userService.CreateUserAsync(request, cancellationToken);
            return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
        }

        /// <summary>
        /// Updates an existing user.
        /// </summary>
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateUser(
            int id,
            [FromBody] UpdateUserRequest request,
            CancellationToken cancellationToken)
        {
            await _userService.UpdateUserAsync(id, request, cancellationToken);
            return NoContent();
        }

        /// <summary>
        /// Deletes a user.
        /// </summary>
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteUser(int id, CancellationToken cancellationToken)
        {
            await _userService.DeleteUserAsync(id, cancellationToken);
            return NoContent();
        }
    }
}
```

## Best Practices Summary

1. ✅ Organize code by feature/module
2. ✅ Use dependency injection for all services
3. ✅ Always use async/await for I/O operations
4. ✅ Support cancellation tokens
5. ✅ Use strongly-typed configuration
6. ✅ Implement global exception handling
7. ✅ Document public APIs with XML comments
8. ✅ Place using directives outside namespace
9. ✅ Avoid regions except for large files
10. ✅ Use .editorconfig for formatting

## When to Apply

Apply these standards when:
- Creating .NET projects
- Building ASP.NET Core APIs
- Implementing services and repositories
- Setting up dependency injection
- Working with Entity Framework Core
- User asks about .NET architecture
