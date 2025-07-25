## GitHub Copilot Custom Instructions & Prompts

Welcome to this project! In this repository, GitHub Copilot is configured to use custom instructions and specific prompts. This ensures Copilot generates code that better matches the requirements and guidelines of this project.

### What are custom instructions?
Custom instructions are additional guidelines provided to Copilot. With these, Copilot can:
- Follow specific code styles or conventions
- Prefer certain frameworks or libraries
- Generate answers and code in the desired language (for example, English)
- Apply project-specific best practices

### How does it work?
1. **Prompts**: When you give Copilot a prompt (question or task), the custom instructions are automatically included in the context.
2. **Automatic application**: Copilot applies these instructions when generating code, documentation, or explanations.
3. **Consistency**: This keeps the code consistent and aligned with project agreements.

### Examples of custom instructions
- Always use semantic HTML.
- Write CSS using the BEM methodology.
- Provide explanations in English.
- Do not use inline styles.

### Tips for using Copilot with custom instructions
- Make your prompts clear and specific.
- Indicate if you want to deviate from the standard instructions.
- Always review the generated code for correctness and style.


### Using the code review prompt in Visual Studio Code

In this repository, you will find a detailed system prompt for reviewing trainee code in `.github/prompts/code-review.prompt.md`. This prompt is designed to provide AI systems, such as GitHub Copilot Chat or other AI plugins in Visual Studio Code, with clear review criteria and feedback style.

**How to use the code review prompt:**
1. Open Copilot
2. Add the files/folders you want to review by clicking the 📎, or by dragging them in.
3. Start by typing `/` and select `/code-review`.
4. You can add extra instructions if you want, but this is optional.
5. Press `enter` and the code review will be performed.

**Tip:** You can also customize this prompt to your own needs or expand it with project-specific points of attention.

### Want to know more?
For more information about setting up custom instructions in Copilot, see the [official documentation](https://docs.github.com/en/copilot).
