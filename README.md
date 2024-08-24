
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
Large language models (LLMs) have revolutionized the field of natural language processing (NLP) in recent years. As a knowledgeable assistant with a background in computer science, I must say that I'm both impressed and intrigued by their capabilities.

The concept of LLMs is based on the idea of training massive neural networks on vast amounts of text data, allowing them to learn patterns, relationships, and structures within language. This enables them to generate human-like text, answer questions, and even engage in conversations.

Some of the key benefits of LLMs include:

1. **Improved language understanding**: LLMs have demonstrated exceptional language comprehension capabilities, allowing them to accurately identify entities, relationships, and context within text.
2. **Text generation**: LLMs can produce coherent, engaging, and often grammatically correct text, making them suitable for applications like chatbots, language translation, and content generation.
3. **Efficient processing**: LLMs can process and analyze vast amounts of text data in a relatively short amount of time, making them ideal for tasks like sentiment analysis, topic modeling, and information retrieval.
4. **Flexibility**: LLMs can be fine-tuned for specific tasks, allowing them to adapt to new domains, languages, and applications.

However, there are also some challenges and limitations associated with LLMs:

1. **Data quality and bias**: LLMs are only as good as the data they're trained on. If the training data is biased or of poor quality, the model's output may reflect these limitations.
2. **Lack of common sense**: While LLMs can process and generate text, they often lack the common sense and real-world experience that humans take for granted.
3. **Explainability**: LLMs can be difficult to interpret, making it challenging to understand how they arrive at their decisions or generate text.
4. **Resource intensity**: Training and deploying LLMs can be computationally expensive and require significant resources.

In terms of applications, LLMs have the potential to transform various industries, including:

1. **Customer service**: Chatbots and virtual assistants powered by LLMs can provide 24/7 support and answer a wide range of questions.
2. **Content creation**: LLMs can assist with content generation, editing, and proofreading, making them useful for writers, journalists, and marketers.
3. **Language translation**: LLMs can improve language translation accuracy and efficiency, breaking language barriers and facilitating global communication.
4. **Education**: LLMs can create personalized learning materials, provide feedback on assignments, and help students with language-related tasks.

In conclusion, large language models are a remarkable achievement in the field of NLP, offering many benefits and applications. However, it's essential to be aware of their limitations and challenges, ensuring that we use them in a responsible and beneficial manner.

As a knowledgeable assistant with a background in computer science, I'm excited to see how LLMs will continue to evolve and improve, enabling us to tackle complex problems and create new opportunities in various fields.
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
Dear Recipient,

I hope this message finds you well.

(Since there's no original text to rewrite, please provide the content that requires revision, and I will assist you accordingly.)
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
"Estimado destinatario, Espero que este mensaje le encuentre bien."

(Note: A more common way to translate "Dear Recipient" in Spanish, especially in formal or business contexts, would be "Estimado/a [Nombre]" or simply "A quien corresponda" if the recipient's name is not known. Alternatively, you could use "Querido/a destinatario" if you want to maintain the same warmth as the original English phrase.)

A more idiomatic translation of the original phrase would be:

"Estimado/a [Nombre], espero que se encuentre bien."

Or, if the recipient is unknown:

"A quien corresponda, espero que se encuentre bien."
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    ```r
    z <- function(x) scale(x)^2  # scales input then squares
    ```

    However, if you wish to provide more informative documentation about the function, consider using Roxygen comments:

    ```r
    #' Squares Scaled Input
    #'
    #' Scales the input using R's built-in scale function and then squares it.
    #'
    #' @param x Input numeric vector
    #' @return Scaled and squared input
    #' @examples
    #' z(c(1, 2, 3, 4, 5))

    z <- function(x) scale(x)^2
    ```

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    Here's a full testthat file with test cases for the given R code.

    ```r
    # File: test_z.R

    library(testthat)

    # Define the function z in this file
    # A more common practice would be to source the file containing 
    # the function or use a package with the function, 
    # here it is defined directly for demonstration purposes

    z <- function(x) {
      # Assuming x is a numeric vector
      # Check for missing values (return NA) and 
      # check for non-numeric values (stop with an error)

      stopifnot(is.numeric(x))

      # Check for missing values
      if (anyNA(x)) {
        stop("Missing values in input")
      }

      # Calculate the square of the scaled input
      scaled_x <- scale(x)
      result <- scaled_x^2

      # Return the result
      return(result)
    }

    # Begin testing
    context("z function")

    test_that("z returns correct result for numeric vector", {
      # Arrange
      x <- c(1, 2, 3, 4, 5)
      expected_result <- c((1 - mean(x))^2, (2 - mean(x))^2, (3 - mean(x))^2, 
                            (4 - mean(x))^2, (5 - mean(x))^2) / var(x)

      # Act
      result <- z(x)

      # Assert
      expect_equivalent(result, expected_result)
    })

    test_that("z handles a single-element numeric vector correctly", {
      # Arrange
      x <- c(1)

      # Act
      result <- tryCatch(z(x), error = function(e) e$message)

      # Assert
      expect_error(result, "undefined columns selected")
      # Or, since NA is given as result for single observation in scale function we can 
      # expect_equivalent result, c(NA))
    })

    test_that("z returns correct result for a numeric vector of length 0", {
      # Arrange
      x <- numeric(0)

      # Act and Assert
      expect_error(z(x), "Input to 'scale' must not be empty.")
    })

    test_that("z handles non-numeric input correctly", {
      # Arrange
      x <- c(1, 2, "3", 4, 5)

      # Act and Assert
      expect_error(z(x), "is.numeric(x) is not TRUE")
    })

    test_that("z handles NA values correctly", {
      # Arrange
      x <- c(1, 2, 3, 4, NA)

      # Act and Assert
      expect_error(z(x), "Missing values in input")
    })

    test_that("z handles missing values", {
      # Arrange
      x <- c(1, 2, 3, 4, NULL)

      # Act and Assert
      expect_error(z(x), "is.numeric(x) is not TRUE")
    })
    ```

    Note: The given function does not handle missing values and non-numeric values explicitly. I made some common assumptions on how it should behave and started with these edge cases in the testing file.

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    The provided code appears to be written in R programming language. There are two issues with this code:

    1. **Mathematical Operator Misplacement**: The syntax `scale(x)2` is not correct. To multiply the result of `scale(x)` by 2, you should use the multiplication operator `*` like this: `scale(x) * 2`.

    2. **Return Statement**: The function `z` is defined but does not have an explicit return statement. However, in R, the last expression evaluated in a function is automatically returned. Since `scale(x) * 2` is the last expression in the function, it will be returned. But it's a good practice to include an explicit return statement for clarity.

    Here is the corrected code:

    ```r
    z <- function(x) {
      return(scale(x) * 2)
    }
    ```

    Alternatively, you can keep it simple:

    ```r
    z <- function(x) scale(x) * 2
    ```

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    Here is the function with in-line documentation in the roxygen2 format, commonly used in R documentation:

    ```r
    #' Scales and Squares Input Vector
    #'
    #' This function scales the input vector x and squares the result.
    #' The scaling is performed using the standard R scale() function, 
    #' which subtracts the mean and divides by the standard deviation 
    #' for each column of the input matrix.
    #'
    #' @param x A numeric vector or matrix to be scaled and squared.
    #' @return A numeric vector or matrix with scaled and squared values.
    #' @examples
    #' z <- function(x)
    scale(x)^2
    ```
    However, in a more traditional R documentation style using roxygen2, the function would be documented as follows:

    ```r
    #' @title Scales and Squares Input Vector
    #' @description 
    #' This function scales the input vector x and squares the result.
    #' 
    #' @param x A numeric vector or matrix to be scaled and squared.
    #' @return A numeric vector or matrix with scaled and squared values.
    #' @examples 
    #' z <- function(x)
    #' \code{
    #'   scale(x)^2
    #' }

    ```

### coder:

This is a basic example which shows you how to finish your code by Groq.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    Here's how you can complete the R function:

    ```r
    # A function to scale a vector and square the resulting z-score
    z2 <- function(x) {
      # Calculate the mean of the input vector
      mean_x <- mean(x, na.rm = TRUE)
      
      # Calculate the standard deviation of the input vector
      sd_x <- sd(x, na.rm = TRUE)
      
      # Check for zero standard deviation to avoid division by zero
      if (sd_x == 0) {
        stop("Cannot calculate z-score for a vector with zero standard deviation.")
      }
      
      # Calculate the z-score
      z_score <- (x - mean_x) / sd_x
      
      # Square the z-score and return the result
      return(z_score^2)
    }

    # Example usage:
    # Generate a random vector of numbers
    set.seed(123)
    x <- rnorm(100)

    # Calculate and print the squared z-scores
    squared_z_scores <- z2(x)
    print(squared_z_scores)
    ```

    This R function takes a numeric vector `x` as input and returns a new vector containing the squared z-scores of each element in `x`. The z-scores are calculated by subtracting the mean of `x` from each element and dividing by the standard deviation of `x`. The squared z-scores are then returned as the output.

    The `na.rm = TRUE` argument in the `mean` and `sd` functions is used to ignore missing values (NaN or NA) in the calculation. The `stop` function is used to terminate the function and display an error message if the standard deviation of the input vector is zero, which would cause division by zero.

    You can test this function using the example usage code provided, which generates a random vector of numbers and prints the squared z-scores.

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    The given R function `z` can be optimized for better performance. The `scale()` function is used to standardize a vector, and when you square the result, it's equivalent to the squared deviations from the mean divided by the variance.

    Here is an optimized version of the function:

    ```r
    z <- function(x) {
      m <- mean(x)
      sd <- sd(x)
      (x - m) ^ 2 / (sd ^ 2)
    }
    ```

    However, calculating `sd(x)` is unnecessary as it is actually `sd(x) = sqrt(sum((x - mean(x))^2) / (length(x) - 1))` for sample standard deviation or `sd(x) = sqrt(sum((x - mean(x))^2) / length(x))` for population standard deviation. 

    We can simplify the function further by directly calculating the squared deviations from the mean and dividing by the variance:

    ```r
    z <- function(x) {
      m <- mean(x)
      v <- sum((x - m) ^ 2) / (length(x) - 1) # sample variance
      (x - m) ^ 2 / v
    }
    ```

    Or, if you're dealing with a population:

    ```r
    z <- function(x) {
      m <- mean(x)
      v <- sum((x - m) ^ 2) / length(x) # population variance
      (x - m) ^ 2 / v
    }
    ```

    This version should give better performance, as it avoids the `scale` and `sd` functions and directly calculates the squared deviations from the mean and the variance.

    We can also use `var()` function directly which takes care of population or sample variance based on input to `var()` like below:

    ```r
    z <- function(x, population = FALSE) {
      m <- mean(x)
      v <- var(x, population = population)
      (x - m) ^ 2 / v
    }
    ```

    You can call this function with `population = TRUE` for population variance or `population = FALSE` for sample variance.

### codeConverter:

This is a basic example which shows you how to translate your code.

``` r
codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
```

    Here's the equivalent Python function:

    ```python
    import numpy as np

    def z(x):
        """
        Scale the input vector x and then square the scaled values.

        Parameters:
        x (numpy array): Input vector.

        Returns:
        z (numpy array): The scaled and squared values of the input vector.
        """
        return (x - np.mean(x)) / np.std(x) ** 2
    ```

    However, the `scale` function in R normalizes the data by subtracting the mean and dividing by the standard deviation, but if the standard deviation is zero or if the `center` or `scale` argument is set to `FALSE` in R's `scale` function, it doesn't raise an error or scale the data.

    So if you want a more exact translation of the R code:

    ```python
    import numpy as np

    def z(x):
        """
        Scale the input vector x and then square the scaled values.

        Parameters:
        x (numpy array): Input vector.

        Returns:
        z (numpy array): The scaled and squared values of the input vector.
        """
        mean_x = np.mean(x)
        std_x = np.std(x)
        if std_x == 0:
            return np.full_like(x, np.inf)  # Return Inf when std_x is 0
        else:
            return ((x - mean_x) / std_x) ** 2
    ```

    This function mimics the behavior of R's `scale` function in the case where the standard deviation of `x` is zero.

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
Based on the coding convention followed in camelCase, a good, memorizable, and short variable name can be stdSq.

Here's a brief explanation of this variable name:

- std: Derived from 'standard deviation', referencing the scale function which typically standardizes values.
- Sq: Abbreviation for 'squared', denoting the squared operation applied to the scaled value.

This name adheres to the camelCase convention, starting with a lowercase letter and using an uppercase letter at the start of the new word within the variable name ('stdSq').
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
