---
name: csharp-standards
description: C# coding standards and conventions including naming, formatting, and best practices. Use when working with .cs files, writing C# code, or when the user asks about C# naming conventions, code structure, XML documentation, or .NET development patterns.
metadata:
    author: devbyray
    version: '1.0'
    language: 'csharp'
    framework: 'dotnet'
---

# C# Coding Standards & Conventions

Apply these standards when writing C# code for .NET projects.

## Naming Conventions

### 1. PascalCase

Use for classes, interfaces, enums, methods, properties, and events:

```csharp
public class UserService { }
public interface IUserRepository { }
public enum OrderStatus { }
public void ProcessOrder() { }
public string FirstName { get; set; }
```

### 2. camelCase

Use for local variables, parameters, and private fields:

```csharp
public void CalculateTotal(int itemCount)
{
    var totalPrice = itemCount * 10;
    var discount = 0.1;
}

private int _orderCount;  // Private field with underscore prefix
```

### 3. Interface Naming

Prefix interfaces with `I`:

```csharp
public interface IRepository { }
public interface IUserService { }
public interface ILogger { }
```

## Access Modifiers

### 4. Explicit Access Modifiers

Always specify access modifiers:

**Good:**

```csharp
public class UserService
{
    private readonly IUserRepository _repository;

    public UserService(IUserRepository repository)
    {
        _repository = repository;
    }

    public async Task<User> GetUserAsync(int id)
    {
        return await _repository.FindByIdAsync(id);
    }

    private bool ValidateUser(User user)
    {
        return !string.IsNullOrEmpty(user.Email);
    }
}
```

**Bad:**

```csharp
class UserService  // Missing public
{
    IUserRepository _repository;  // Missing private
}
```

## Modern C# Features

### 5. Expression-Bodied Members

Use for simple properties and methods:

```csharp
// Properties
public string FullName => $"{FirstName} {LastName}";
public bool IsActive => Status == UserStatus.Active;

// Methods
public int Add(int a, int b) => a + b;
public void LogError(string message) => _logger.LogError(message);

// Constructors
public User(string name) => Name = name;
```

### 6. Var Keyword

Use `var` when the type is obvious:

**Good:**

```csharp
var user = new User();  // Type is obvious
var count = GetCount();  // Return type is clear
var items = new List<string>();  // Type is clear
```

**Questionable:**

```csharp
var result = repository.GetData();  // What type is result?
```

**Better:**

```csharp
List<User> users = repository.GetUsers();  // Explicit when helpful
```

### 7. Pattern Matching

Use modern pattern matching features:

```csharp
// Type patterns
if (obj is User user)
{
    Console.WriteLine(user.Name);
}

// Switch expressions
var discount = orderTotal switch
{
    < 100 => 0,
    < 500 => 0.05,
    < 1000 => 0.10,
    _ => 0.15
};

// Property patterns
var shipping = customer switch
{
    { IsPremium: true } => 0,
    { OrderCount: > 10 } => 5,
    _ => 10
};
```

### 8. Null-Coalescing and Null-Conditional

```csharp
// Null-coalescing
var name = user?.Name ?? "Guest";

// Null-conditional
var length = user?.Address?.City?.Length;

// Null-coalescing assignment (C# 8.0+)
_cache ??= new Dictionary<string, object>();
```

## Code Structure

### 9. Always Use Braces

Use braces even for single statements:

**Good:**

```csharp
if (user != null)
{
    ProcessUser(user);
}

foreach (var item in items)
{
    Console.WriteLine(item);
}
```

**Bad:**

```csharp
if (user != null)
    ProcessUser(user);
```

### 10. Avoid Magic Numbers

Use named constants or enums:

**Bad:**

```csharp
if (status == 1)
{
    // What does 1 mean?
}
```

**Good:**

```csharp
private const int ActiveStatus = 1;

if (status == ActiveStatus)
{
    // Clear intent
}
```

**Better:**

```csharp
public enum UserStatus
{
    Inactive = 0,
    Active = 1,
    Suspended = 2
}

if (status == UserStatus.Active)
{
    // Best: self-documenting
}
```

### 11. String Literals

Use double quotes for strings, single quotes for chars:

```csharp
string message = "Hello, World!";
char delimiter = ',';
```

## Documentation

### 12. XML Documentation Comments

Document public APIs, classes, and methods:

```csharp
/// <summary>
/// Calculates the sum of two integers.
/// </summary>
/// <param name="a">The first integer.</param>
/// <param name="b">The second integer.</param>
/// <returns>The sum of a and b.</returns>
/// <exception cref="OverflowException">
/// Thrown when the result exceeds Int32.MaxValue.
/// </exception>
public static int Add(int a, int b)
{
    return checked(a + b);
}
```

```csharp
/// <summary>
/// Represents a user in the system.
/// </summary>
public class User
{
    /// <summary>
    /// Gets or sets the user's unique identifier.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the user's email address.
    /// </summary>
    public string Email { get; set; }
}
```

## Async/Await

### 13. Async Method Naming

Suffix async methods with `Async`:

```csharp
public async Task<User> GetUserAsync(int id)
{
    return await _repository.FindByIdAsync(id);
}

public async Task SaveUserAsync(User user)
{
    await _repository.SaveAsync(user);
}
```

### 14. Async Best Practices

```csharp
// Always await async calls
public async Task ProcessOrderAsync(Order order)
{
    await ValidateOrderAsync(order);
    await SaveOrderAsync(order);
    await SendConfirmationAsync(order);
}

// Use ConfigureAwait(false) in libraries
public async Task<Data> FetchDataAsync()
{
    var response = await _httpClient.GetAsync(url).ConfigureAwait(false);
    return await response.Content.ReadAsAsync<Data>().ConfigureAwait(false);
}
```

## Complete Example

```csharp
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyApp.Services
{
    /// <summary>
    /// Service for managing user operations.
    /// </summary>
    public class UserService : IUserService
    {
        private readonly IUserRepository _repository;
        private readonly ILogger<UserService> _logger;
        private const int MaxRetryAttempts = 3;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserService"/> class.
        /// </summary>
        /// <param name="repository">The user repository.</param>
        /// <param name="logger">The logger instance.</param>
        public UserService(IUserRepository repository, ILogger<UserService> logger)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        /// <summary>
        /// Gets a user by their unique identifier.
        /// </summary>
        /// <param name="id">The user's ID.</param>
        /// <returns>The user if found; otherwise, null.</returns>
        public async Task<User?> GetUserByIdAsync(int id)
        {
            if (id <= 0)
            {
                throw new ArgumentException("ID must be greater than zero.", nameof(id));
            }

            try
            {
                var user = await _repository.FindByIdAsync(id);
                return user;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving user with ID {UserId}", id);
                throw;
            }
        }

        /// <summary>
        /// Creates a new user.
        /// </summary>
        /// <param name="user">The user to create.</param>
        /// <returns>The created user with assigned ID.</returns>
        public async Task<User> CreateUserAsync(User user)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }

            if (!IsValidUser(user))
            {
                throw new ValidationException("Invalid user data.");
            }

            var createdUser = await _repository.AddAsync(user);
            _logger.LogInformation("User created with ID {UserId}", createdUser.Id);

            return createdUser;
        }

        /// <summary>
        /// Validates user data.
        /// </summary>
        private bool IsValidUser(User user)
        {
            return !string.IsNullOrWhiteSpace(user.Email)
                && !string.IsNullOrWhiteSpace(user.Name);
        }

        /// <summary>
        /// Gets the user's display name.
        /// </summary>
        public string GetDisplayName(User user) =>
            user?.Name ?? "Guest";
    }
}
```

## Best Practices Summary

1. ✅ Use PascalCase for public members, camelCase for private
2. ✅ Always use explicit access modifiers
3. ✅ Prefer expression-bodied members for simple code
4. ✅ Use `var` when type is obvious
5. ✅ Always use braces for control flow
6. ✅ Document public APIs with XML comments
7. ✅ Suffix async methods with `Async`
8. ✅ Use pattern matching and modern C# features
9. ✅ Avoid magic numbers
10. ✅ End every statement with a semicolon

## When to Apply

Apply these standards when:

- Writing C# code
- Creating classes and interfaces
- Reviewing C# code
- Setting up new .NET projects
- User asks about C# conventions
