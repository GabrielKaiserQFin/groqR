
<!-- README.md is generated from README.Rmd. Please edit that file -->

# groqR

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/groqR)](https://CRAN.R-project.org/package=groqR)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/groqR)](https://cran.rstudio.com/web/packages/groqR/index.html)
[![R-CMD-check](https://github.com/GabrielKaiserQFin/groqR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/GabrielKaiserQFin/groqR/actions/workflows/R-CMD-check.yaml)
[![R-CMD-check](https://github.com/GabrielKaiserQFin/groqR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/GabrielKaiserQFin/groqR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The objective of `groqR` is to offer R users an intuitive interface for
leveraging the capabilities of the [Groq API](https://groq.com/).
Utilizing the supplied functions, users can enhance their programming
productivity by incorporating Large Language Models. Furthermore,
`groqR` includes a RStudio addin, enabling seamless interactive
integration of Groq prompts.

## Installation

You can install the development version of groqR from
[GitHub](https://github.com/GabrielKaiserQFin/groqR) with:

``` r
# install.packages("devtools")
devtools::install_github("GabrielKaiserQFin/groqR")
```

<!-- Or install the current released version of `{groqR}` from  -->
<!-- [CRAN](https://cran.r-project.org/package=groqR): -->
<!-- ```{r eval = FALSE} -->
<!-- install.packages("groqR") -->
<!-- ``` -->

## Requirements

You need to create a free account and a free API key by accessing [Groq
API page](https://console.groq.com/keys), otherwise you can not use
`{groqR}`.

To use your API key in `{groqR}`, you need to configure the function
parameters in the .Renviron file. At the first run a shiny app will
start, and you will be guided through a setup process.

## Examples

### Addins:

In your RStudio go to **Addins** and select **ASK Groq**, which will
open an interactive prompt in your Viewer, where you can choose between
different models and adjust the temperature and the number of tokens to
be used. Just ask anything of you interest and hit the confirm button.
The **Done** button let you close the App. Similarly, you can mark or
copy any text or code and use the other Addins as described below. Addin
shortcuts will improve your efficiency even further.

### Ask:

This is a basic example which shows you how to ask any question.

``` r
ask("What do you think about Large language models?")
Large language models (LLMs) are a fascinating area of research that has gained significant attention in recent years. As a computer science expert, I'll provide an overview of LLMs and share my thoughts on their capabilities, limitations, and potential applications.

**What are Large Language Models?**

Large language models are a type of artificial intelligence (AI) designed to process and generate human-like language. They are trained on vast amounts of text data, which enables them to learn patterns, relationships, and structures of language. LLMs use complex algorithms, such as transformer architectures, to analyze and generate text.

**Capabilities:**

1. **Text Generation**: LLMs can generate coherent and context-specific text, including articles, stories, and even entire books.
2. **Language Translation**: LLMs can translate text from one language to another, often with remarkable accuracy.
3. **Text Summarization**: LLMs can summarize long pieces of text into concise, meaningful summaries.
4. **Conversational AI**: LLMs can engage in natural-sounding conversations, using context and understanding to respond to questions and statements.
5. **Language Understanding**: LLMs can comprehend the meaning of text, including nuances like idioms, sarcasm, and figurative language.

**Limitations:**

1. **Lack of Common Sense**: LLMs often struggle to understand the world in the same way humans do, leading to nonsensical or unrealistic responses.
2. **Bias and Stereotypes**: LLMs can perpetuate biases and stereotypes present in the training data, which can be problematic.
3. **Overfitting**: LLMs can become overly specialized in the training data, leading to poor performance on unseen data.
4. **Explainability**: LLMs can be difficult to interpret, making it challenging to understand why they generate certain responses.

**Potential Applications:**

1. **Virtual Assistants**: LLMs can power virtual assistants, such as chatbots, to provide customer support and answer frequently asked questions.
2. **Content Generation**: LLMs can generate high-quality content, such as articles, social media posts, and even entire books.
3. **Language Learning**: LLMs can aid language learners by providing personalized feedback, corrections, and practice exercises.
4. **Sentiment Analysis**: LLMs can analyze text to determine sentiment, which can be useful in applications like customer feedback analysis.

**Future Directions:**

1. **Multimodal Learning**: LLMs can be extended to incorporate multimodal inputs, such as images, audio, and video, to better understand the world.
2. **Explainability and Transparency**: Researchers are working to develop techniques to explain and interpret LLMs' decision-making processes.
3. **Adversarial Robustness**: LLMs can be designed to be more robust against adversarial attacks, which aim to manipulate or deceive the model.

In conclusion, large language models have made tremendous progress in recent years, and their potential applications are vast. However, it's essential to acknowledge their limitations and continue to work on addressing these challenges to ensure that LLMs are developed and used responsibly.
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
Here's a rewritten version of the text, maintaining the original language and incorporating professional tone, grammatical accuracy, and efficient communication:

"Dear Recipient,

I hope this message finds you well.

[Insert main content here]

Please do not hesitate to contact me if you require any further information or clarification.

Best regards,
[Your Name]"

However, since the original text is incomplete, I've added a basic structure to accommodate the main content and a polite closing. Please provide the complete text for a more accurate and comprehensive rewrite.
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
"Estimado destinatario, espero que este mensaje le encuentre bien."

However, a more common translation in formal Spanish would be:

"Estimado/a destinatario/a, espero que este mensaje le encuentre bien."

Or in a more polite and formal tone:

"Estimado/a destinatario/a, le deseo que se encuentre bien al recibir este mensaje."

Note: The use of "a" after "Estimado" and "destinatario" is to make the sentence more inclusive and respectful, as it acknowledges that the recipient could be either male or female.
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    ```r
    z <- function(x) scale(x)^2  # square and standardize input vector
    ```

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    Here's an example of a testthat file that tests the function `z`:
    ```r
    # tests/test_z.R

    library(testthat)

    context("z function")

    test_z <- function() {
      # Test case 1: Positive values
      test_that("z function works with positive values", {
        x <- c(1, 2, 3)
        expected_result <- (x - mean(x)) / sd(x) * (x - mean(x)) / sd(x)
        expect_equal(z(x), expected_result)
      })

      # Test case 2: Negative values
      test_that("z function works with negative values", {
        x <- c(-1, -2, -3)
        expected_result <- (x - mean(x)) / sd(x) * (x - mean(x)) / sd(x)
        expect_equal(z(x), expected_result)
      })

      # Test case 3: Zero values
      test_that("z function works with zero values", {
        x <- c(0, 0, 0)
        expected_result <- numeric(length(x))
        expect_equal(z(x), expected_result)
      })

      # Test case 4: Missing values
      test_that("z function returns NA for missing values", {
        x <- c(1, 2, NA)
        expected_result <- c((1 - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE) * 
                                 (1 - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE),
                               (2 - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE) * 
                                 (2 - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE),
                               NA)
        expect_equal(z(x), expected_result)
      })

      # Test case 5: Constant values
      test_that("z function returns zero for constant values", {
        x <- c(1, 1, 1)
        expected_result <- numeric(length(x))
        expect_equal(z(x), expected_result)
      })

      # Test case 6: Empty input
      test_that("z function returns an error for empty input", {
        x <- numeric()
        expect_error(z(x), "input cannot be empty")
      })

      # Test case 7: Non-numeric input
      test_that("z function returns an error for non-numeric input", {
        x <- c("a", "b", "c")
        expect_error(z(x), "input must be numeric")
      })
    }

    test_z()
    ```
    Note that you need to have the `z` function defined in your R environment for these tests to work. You can define it in a separate file, for example:
    ```r
    # R/z.R

    z <- function(x) {
      if (!is.numeric(x)) {
        stop("input must be numeric")
      }
      if (length(x) == 0) {
        stop("input cannot be empty")
      }
      scale(x)^2
    }
    ```
    Make sure to load the `z` function before running the tests.

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    The code provided appears to be written in R programming language. 

    Here are a few potential issues with the code:

    1. **Typo in function definition**: The function definition is missing a parenthesis after `scale(x)`. It should be `scale(x)^2` instead of `scale(x)2`. The corrected line should be:
       ```r
    z <- function(x) scale(x)^2
    ```

    2. **Missing return statement**: Although in R, the last expression in a function is implicitly returned, it's a good practice to include an explicit return statement for clarity. The corrected function should be:
       ```r
    z <- function(x) {
      return(scale(x)^2)
    }
    ```

    3. **No input validation**: The function does not check if the input `x` is a numeric vector or a matrix, which is required for the `scale` function to work correctly. It's a good practice to include input validation to prevent potential errors. The corrected function should be:
       ```r
    z <- function(x) {
      if (!is.numeric(x) & !is.matrix(x)) {
        stop("Input must be a numeric vector or a matrix")
      }
      return(scale(x)^2)
    }
    ```

    4. **No handling for missing values**: The function does not handle missing values in the input `x`. The `scale` function will return `NA` if there are missing values in the input. It's a good practice to include a check for missing values and handle them accordingly. The corrected function should be:
       ```r
    z <- function(x) {
      if (!is.numeric(x) & !is.matrix(x)) {
        stop("Input must be a numeric vector or a matrix")
      }
      if (anyNA(x)) {
        warning("Input contains missing values")
      }
      return(scale(x)^2)
    }
    ```

    5. **No documentation**: The function does not include any documentation, such as a description of what the function does, what input it expects, and what output it returns. It's a good practice to include documentation for clarity and maintainability. The corrected function should include a description, input parameters, and return values.

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    ```r
    ##' Compute Squared Scaled Values
    ##'
    ##' This function computes the squared scaled values of the input data.
    ##' The input data is first scaled (centered and scaled to have unit variance),
    ##' then squared to compute the final output values.
    ##'
    ##' @param x The input data.
    ##' @return The squared scaled values of the input data.
    ##'
    ##' @examples
    ##' z(c(1, 2, 3))
    z <- function(x) {
      # Compute scaled values
      scaled_x <- scale(x)
      
      # Compute squared scaled values
      result <- scaled_x^2
      
      return(result)
    }
    ```

    Note that you could simply leave your function like the one you mentioned initially because there's only one operation there but sometimes documenting small changes will have drastic results as soon as they accumulate or projects gets a whole lot larger, using multiple team.

### coder:

This is a basic example which shows you how to finish your code by Groq.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    Here's the completed R code for a function that scales a vector and squares the resulting z-score:

    ```r
    # A function to scale a vector and square the resulting z-score
    z2 <- function(x) {
      # Calculate the mean of the vector
      mean_x <- mean(x)
      
      # Calculate the standard deviation of the vector
      sd_x <- sd(x)
      
      # Check for zero standard deviation to avoid division by zero
      if (sd_x == 0) {
        stop("Standard deviation is zero. Cannot calculate z-score.")
      }
      
      # Calculate the z-score
      z_score <- (x - mean_x) / sd_x
      
      # Square the z-score
      z_score_squared <- z_score^2
      
      return(z_score_squared)
    }

    # Example usage:
    x <- c(1, 2, 3, 4, 5)
    z_score_squared <- z2(x)
    print(z_score_squared)
    ```

    This function takes a vector `x` as input, calculates the mean and standard deviation of the vector, and then calculates the z-score by subtracting the mean from each element and dividing by the standard deviation. The z-score is then squared and returned as the result. The function also includes a check to avoid division by zero in case the standard deviation is zero.

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    Here's an optimized version of the R code:

    ```r
    z <- function(x) (x - mean(x))^2 / var(x)
    ```

    Explanation:

    1.  **Removing `scale()` function:** In your original code, `scale(x)` is used which scales the input `x` by subtracting its mean and then dividing by its standard deviation. We removed the `scale()` function and added `(x - mean(x))^2 / var(x)` to optimize the calculation and avoid handling of standard deviation explicitly.
    2.  **Improved calculation:** `(x - mean(x))^2 / var(x)` efficiently computes the squares of the scaled values.

    However, the provided solution is optimized but has different result than original solution.

    Original code was `z <- function(x) scale(x)^2` which actually is equivalent to `(x - mean(x))^2 / var(x)` which is normality test not just squaring of scaled data.

    The better approach would be

    ```r
    z <- function(x) {
      mean_x <- mean(x)
      var_x <- var(x)
      (x - mean_x)^2 / var_x
    }
    ```

    Or you can still use scale but don't square the result directly. Square each column of result instead.

    ```r
    z <- function(x) {
      result <- scale(x)
      result^2
    }
    ```

### codeConverter:

This is a basic example which shows you how to translate your code.

``` r
codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
```

    Here's the equivalent Python code for the given R function:

    ```python
    import numpy as np

    def z(x):
        """
        This function takes a vector or array as input, standardizes it by subtracting the mean and dividing by the standard deviation, 
        and then squares the result.
        
        Parameters:
        x (array-like): The input array to be standardized and squared.
        
        Returns:
        array-like: The standardized and squared array.
        """
        centered = x - np.mean(x)
        std_dev = np.std(x)
        standardized = centered / std_dev
        return standardized ** 2

    # Example usage:
    import numpy as np
    data = np.array([1, 2, 3, 4, 5])
    result = z(data)
    print(result)
    ```

    However, for better performance and compatibility with pandas DataFrames, you can use the following code with `StandardScaler` from `scikit-learn`:

    ```python
    from sklearn.preprocessing import StandardScaler
    import numpy as np

    def z(x):
        scaler = StandardScaler()
        standardized = scaler.fit_transform(np.array([x]).T)**2
        return standardized.flatten()

    # Example usage:
    data = np.array([1, 2, 3, 4, 5])
    result = z(data)
    print(result)
    ```

    Or using pandas:

    ```python
    import pandas as pd

    def z(x):
        return (x - x.mean())**2 / x.std()**2

    # Example usage:
    data = pd.Series([1, 2, 3, 4, 5])
    result = z(data)
    print(result)
    ```

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
Based on the given function, a suitable variable name in camelCase convention could be `squaredScale`. This name is short, memorable, and clearly indicates the operation being performed.

Alternatively, you could also consider these other options:

- `scaledSquared`
- `scaleSquared`
- `squaredScaling`

However, `squaredScale` seems to be the most concise and readable option.
```

## Groq Model Arguments

The model parameters can be adjusted by passing functional arguments.

- `text` or `code`: The text or code input required for processing by
  Groq. If omitted, Groq will utilize the content currently held in the
  clipboard.

- `GROQ_API_KEY`: The Groq API key. By default it is set to
  `Sys.getenv("GROQ_API_KEY")`.

- `model`: model choice. Default is “`llama-3.1-70b-versatile`” but
  other available [models](https://console.groq.com/docs/models) are:
  “`llama-3.1-8b-instant`”, “`llama3-groq-70b-8192-tool-use-preview`”,
  “`llama3-groq-8b-8192-tool-use-preview`”, “`llama-guard-3-8b`”,
  “`llama3-70b-8192`”, “`llama3-8b-8192`”, “`mixtral-8x7b-32768`”,
  “`gemma-7b-it`”, “`gemma2-9b-it`”, “`whisper-large-v3`”

- `systemRole`: System role for model. Default is set to “You are a
  helpful assistant”.

- `maxTokens`: The maximum integer of completion tokens returned by the
  API. The total number of tokens requested in max_tokens plus the
  number of prompt tokens sent in messages must not exceed the context
  window token limit of model requested. If left unspecified, then the
  model will generate tokens until either it reaches its stop token or
  the end of its context window.

- `temperatur`: The amount of randomness in the response, valued between
  0 inclusive and 2 exclusive. Higher values are more random, and lower
  values are more deterministic. You should either set temperature or
  top_p, but not both.

- `top_p`: The nucleus sampling threshold, valued between 0 and 1
  inclusive. For each subsequent token, the model considers the results
  of the tokens with top_p probability mass. You should either alter
  temperature or top_p, but not both.

- `proxy`: Default value is NULL. To execute Groq queries via a proxy
  server, specify the proxy address and port as an argument to the
  function instance. Use the following format:
  `"proxy_address:proxy_port"`. An example would be:
  `"81.94.255.13:8080"`

- `returnType`: Default is 3, which returns the output to the clipboard
  and returns TRUE, type 2 is unchanged and type 1 cats the output.
