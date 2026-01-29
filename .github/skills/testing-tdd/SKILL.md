---
name: testing-tdd
description: Test-Driven Development workflow and testing standards. Use when writing tests, implementing TDD, working with Vitest (frontend), xUnit or MsTest (backend), or when the user asks about testing strategies, test coverage, or TDD methodology.
metadata:
    author: devbyray
    version: '1.0'
    frameworks: 'vitest, xunit, mstest'
    methodology: 'tdd'
---

# Testing & TDD Workflow

Apply Test-Driven Development methodology to ensure reliability and confidence when adding new features.

## TDD Workflow

Follow this cycle for all new features:

### 1. Write the Test First

**Frontend (JavaScript/TypeScript)**

- Use **Vitest** for all frontend tests
- Name tests clearly and descriptively

**Backend (C#/.NET)**

- Use **xUnit** or **MsTest** (based on project)
- Follow the same naming conventions

**Test Naming Convention**

```
shouldDoSomethingWhenCondition()
```

### 2. Generate Code

- Write the minimal code needed to make the test pass
- Use GitHub Copilot to help implement based on the test
- Keep implementations simple and focused

### 3. Run Tests and Iterate

- Run the test suite
- Fix failures
- Refactor if needed
- Repeat until all tests pass

## Testing Best Practices

### Coverage

- Write tests for all new features and bug fixes
- Ensure tests cover edge cases and error handling
- Test both happy paths and error scenarios

### Test Quality

- Keep tests focused and isolated
- One assertion concept per test
- Use descriptive test names that explain the scenario
- **NEVER change the original code to make it easier to test**

### Test Structure (AAA Pattern)

```javascript
// Arrange - Set up test data and conditions
// Act - Execute the code being tested
// Assert - Verify the results
```

## Examples

### Frontend Test (Vitest)

```javascript
import { describe, it, expect } from 'vitest'
import { calculateTotal } from './cart'

describe('calculateTotal', () => {
	it('shouldReturnZeroWhenCartIsEmpty', () => {
		// Arrange
		const cart = []

		// Act
		const total = calculateTotal(cart)

		// Assert
		expect(total).toBe(0)
	})

	it('shouldCalculateTotalWithMultipleItems', () => {
		// Arrange
		const cart = [
			{ price: 10, quantity: 2 },
			{ price: 5, quantity: 3 }
		]

		// Act
		const total = calculateTotal(cart)

		// Assert
		expect(total).toBe(35)
	})

	it('shouldThrowErrorWhenItemHasNegativePrice', () => {
		// Arrange
		const cart = [{ price: -10, quantity: 1 }]

		// Act & Assert
		expect(() => calculateTotal(cart)).toThrow('Price cannot be negative')
	})
})
```

### Backend Test (xUnit)

```csharp
using Xunit;

public class CartCalculatorTests
{
    [Fact]
    public void ShouldReturnZeroWhenCartIsEmpty()
    {
        // Arrange
        var cart = new List<CartItem>();
        var calculator = new CartCalculator();

        // Act
        var total = calculator.CalculateTotal(cart);

        // Assert
        Assert.Equal(0, total);
    }

    [Fact]
    public void ShouldCalculateTotalWithMultipleItems()
    {
        // Arrange
        var cart = new List<CartItem>
        {
            new CartItem { Price = 10, Quantity = 2 },
            new CartItem { Price = 5, Quantity = 3 }
        };
        var calculator = new CartCalculator();

        // Act
        var total = calculator.CalculateTotal(cart);

        // Assert
        Assert.Equal(35, total);
    }

    [Fact]
    public void ShouldThrowExceptionWhenItemHasNegativePrice()
    {
        // Arrange
        var cart = new List<CartItem> { new CartItem { Price = -10, Quantity = 1 } };
        var calculator = new CartCalculator();

        // Act & Assert
        Assert.Throws<ArgumentException>(() => calculator.CalculateTotal(cart));
    }
}
```

## TDD Benefits

Following this workflow ensures:

- ✅ Code is testable by design
- ✅ Better code coverage
- ✅ Fewer bugs in production
- ✅ Confidence when refactoring
- ✅ Living documentation through tests
- ✅ Faster development in the long run

## When to Apply

Apply TDD when:

- Implementing new features
- Fixing bugs (write a failing test first)
- Refactoring existing code
- User requests testing implementation
- Starting a new project or module
