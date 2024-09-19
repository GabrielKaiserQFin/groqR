
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
leveraging the capabilities of the [‘Groq API’](https://groq.com/).
Utilizing the supplied functions, users can enhance their programming
productivity by incorporating Large Language Models. Furthermore,
`groqR` includes a RStudio addin, enabling seamless interactive
integration of ‘Groq’ prompts.

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

You need to create a free account and a free ‘API’ key by accessing
[‘Groq API’ page](https://console.groq.com/keys), otherwise you can not
use `{groqR}`.

To use your ‘API’ key in `{groqR}`, you need to configure the function
parameters in the .Renviron file. At the first run a shiny app will
start, and you will be guided through a setup process.

## Examples

### Addins:

In your RStudio go to **Addins** and select **ASK ‘Groq’**, which will
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
[1] "As someone with a background in multiple fields, I must say I'm both fascinated and impressed by large language models (LLMs). From a technical standpoint, I think LLMs represent a remarkable achievement in the field of natural language processing (NLP) and deep learning. These models have made tremendous progress in understanding and generating human-like language, which has far-reaching implications for various applications such as text summarization, translation, chatbots, and even content creation.\n\nSome of the aspects that I find particularly intriguing about LLMs are:\n\n1. **Scalability**: The ability of LLMs to learn from vast amounts of data and handle complex linguistic patterns is truly impressive. This scalability has enabled LLMs to achieve state-of-the-art performance in many NLP tasks.\n2. **Transfer learning**: LLMs can leverage pre-trained knowledge to fine-tune their performance on specific tasks, which has led to remarkable improvements in NLP tasks such as sentiment analysis, question answering, and machine translation.\n3. **Explainability**: Although LLMs are often seen as black boxes, researchers have made significant efforts to improve their explainability. Techniques like feature importance, attention visualization, and interpretability methods have shed some light on the inner workings of LLMs.\n4. **Potential applications**: LLMs have a wide range of applications, from improving customer service chatbots to generating personalized content, medical text summarization, and even creative writing.\n\nHowever, as with any powerful technology, there are concerns and challenges associated with LLMs, such as:\n\n1. **Bias and fairness**: LLMs can perpetuate biases and stereotypes present in the training data, which is a major concern for fair and inclusive language processing.\n2. **Data hunger**: LLMs require vast amounts of data to learn, which can lead to data scarcity issues and questions around data ownership and quality.\n3. **Energy consumption**: Training large language models is a computationally intensive process that consumes a significant amount of energy and resources.\n4. **Lack of common sense**: While LLMs have made tremendous progress, they still lack common sense and real-world experience, which can lead to nonsensical or impractical outputs in certain situations.\n\nOverall, I believe that LLMs have the potential to revolutionize many industries and improve human lives, but it's crucial to address the associated challenges and concerns to ensure that these models are used responsibly and equitably.\n\nAs someone with a background in statistics and finance, I'm also interested in exploring the econometric implications of LLMs, such as their potential to improve forecasting models, automate financial reporting, and generate personalized investment advice. However, this is a topic for another discussion."
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
[1] "Dear Recipient, \n\nI hope this message finds you well. \n\n(Please provide the rest of the text you would like me to rewrite. I'll ensure the rewritten text is professionally written, grammatically correct, and efficiently communicated.)"
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
[1] "Here's the translation: \n\n\"Estimado destinatario, espero que este mensaje le encuentre bien.\"\n\nHowever, a more common and polite translation would be:\n\n\"Estimado destinatario, espero que se encuentre bien.\"\n\nThis small change makes the sentence more grammatically correct and culturally suitable in Spanish."
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    [1] "```r\nz <- function(x) scale(x)^2  # define function to standardize and square\n```"

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    [1] "Here's a full testthat file for the given function:\n\n```r\n# tests/test_z_function.R\n# Test that file for z function\n\nlibrary(testthat)\n\ncontext(\"z function\")\n\ntest_z_function <- testthat::test_file(\"z_function_test.R\")\n\ntest_z_function_test <- function() {\n  # Test 1: Check for correct output with positive values\n  test_that(\"z function returns correct output for positive values\", {\n    x <- c(1, 2, 3, 4, 5)\n    y <- c(2.8853801, 0.4766230, 0.1421349, 0.0284493, 0.0060000)\n    expect_equal(z(x), y, tolerance = 1e-6)\n  })\n\n  # Test 2: Check for correct output with negative values\n  test_that(\"z function returns correct output for negative values\", {\n    x <- c(-1, -2, -3, -4, -5)\n    y <- c(2.8853801, 0.4766230, 0.1421349, 0.0284493, 0.0060000)\n    expect_equal(z(x), y, tolerance = 1e-6)\n  })\n\n  # Test 3: Check for correct output with zero values\n  test_that(\"z function returns correct output with zero values\", {\n    x <- c(0, 0, 0, 0, 0)\n    y <- c(0, 0, 0, 0, 0)\n    expect_equal(z(x), y)\n  })\n\n  # Test 4: Check for error with NA values\n  test_that(\"z function returns error for NA values\", {\n    x <- c(1, NA, 2)\n    expect_error(z(x), class = \"NA\")\n  })\n\n  # Test 5: Check for error with non-numeric values\n  test_that(\"z function returns error for non-numeric values\", {\n    x <- c(1, 2, \"a\")\n    expect_error(z(x), class = \"non-numeric\")\n  })\n}\n\nif (!interactive()) {\n  test_z_function_test()\n}\n```"

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    [1] "## Issues in the Code\n\nThe given code is written in R programming language. \n\n### 1. Syntax Error\n\nThe code `z <- function(x) scale(x)2` has a syntax error. The `2` is not correctly separated from the `scale(x)`. It seems like you intended to multiply the output of `scale(x)` by 2. You can fix this by adding a multiplication operator (`*`) between `scale(x)` and `2`. \n\nCorrected code:\n```r\nz <- function(x) scale(x) * 2\n```\n\n### 2. Lack of Input Validation\n\nThe function `z` does not check if the input `x` is a numeric vector, which is the expected input type for the `scale` function. If `x` is not a numeric vector, this function may fail or produce unexpected results.\n\nYou can add input validation to check if `x` is a numeric vector:\n```r\nz <- function(x) {\n  if (!is.numeric(x)) {\n    stop(\"Input x must be a numeric vector.\")\n  }\n  scale(x) * 2\n}\n```\n\n### 3. Lack of Documentation\n\nThe function `z` does not have any documentation. It's good practice to add comments or a help file to explain what the function does, what input it expects, and what output it produces.\n\nYou can add a help file or comments to the function:\n```r\n#' Scales a numeric vector by a factor of 2\n#'\n#' @param x A numeric vector\n#'\n#' @return A scaled numeric vector\n#'\n#' @examples\n#' x <- 1:10\n#' z(x)\nz <- function(x) {\n  if (!is.numeric(x)) {\n    stop(\"Input x must be a numeric vector.\")\n  }\n  scale(x) * 2\n}\n```\n\n### 4. Potential NA or NaN Issues\n\nIf the input vector `x` contains NA or NaN values, the `scale` function may produce unexpected results or warnings. You may want to add checks for NA or NaN values and decide how to handle them.\n\nYou can add checks for NA or NaN values:\n```r\nz <- function(x) {\n  if (!is.numeric(x)) {\n    stop(\"Input x must be a numeric vector.\")\n  }\n  if (anyNA(x) | any(is.nan(x))) {\n    stop(\"Input x must not contain NA or NaN values.\")\n  }\n  scale(x) * 2\n}\n```"

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    [1] "Here is an in-line documentation for the given function using the Rd format in R.\n\n```\n#' Centered and Scaled Square Function\n#'\n#' This function takes a numerical vector as input, scales it by subtracting its mean and \n#' dividing by its standard deviation, and then returns the square of each value.\n#'\n#' @param x A numeric vector to be centered and scaled.\n#'\n#' @return A numeric vector where each element is the square of the corresponding value \n#' in the input vector after centering and scaling.\n#'\n#' @examples\n#' z <- function(x) scale(x)^2\n#' v <- c(1, 2, 3, 4, 5)\n#' z(v)\n#'\n#' @author [Your Name]\n#' @seealso \\code{\\link{scale}}\n```"

### coder:

This is a basic example which shows you how to finish your code by
‘Groq’.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    [1] "Here's the completed R code for the function that scales a vector and squares the resulting z-score:\n\n```r\n# A function to scale a vector and square the resulting z-score\nz2 <- function(x) {\n  # Calculate the mean of the vector\n  mean_x <- mean(x, na.rm = TRUE)\n  \n  # Calculate the standard deviation of the vector\n  sd_x <- sd(x, na.rm = TRUE)\n  \n  # Calculate the z-score for each element in the vector\n  z_score <- (x - mean_x) / sd_x\n  \n  # Square the resulting z-score and return the vector\n  return(z_score^2)\n}\n\n# Example usage:\nvector <- rnorm(100, mean = 10, sd = 2)\nscaled_vector <- z2(vector)\nprint(scaled_vector)\n```\n\nHowever, if you want to simplify the code by using the `scale()` function in R that already scales the vector to have mean 0 and standard deviation 1:\n\n```r\n# A function to scale a vector and square the resulting z-score\nz2 <- function(x) {\n  # Scale the vector and square the resulting z-score\n  return((scale(x))^2)\n}\n\n# Example usage:\nvector <- rnorm(100, mean = 10, sd = 2)\nscaled_vector <- z2(vector)\nprint(scaled_vector)\n```"

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    [1] "## Optimized R Code\n\nThe given R code can be optimized as follows:\n\n```r\nz <- function(x) x^2 / var(x)\n```\n\nExplanation:\n\n- The original code uses the `scale()` function, which has a default effect of subtracting the mean and dividing by the standard deviation of the input vector `x`. This results in a vector with mean 0 and standard deviation 1. When this vector is squared, the mean is not longer 0 due to the non-linear transformation.\n\n- A more efficient way to achieve the same effect is to directly calculate the squared values and then divide by the variance of `x`. In statistics, the variance of a random variable `X` is defined as the expected value of the square of the deviation of `X` from its mean. In R, `var(x)` calculates the variance of `x`.\n\n- This optimized code achieves the same result as the original code but with improved performance, as it eliminates the need to calculate the standard deviation, which can be computationally expensive.\n\n## Performance Comparison\n\nHere is a sample benchmarking code that compares the execution times of the original and optimized functions:\n\n```r\n# Load the microbenchmark package\nlibrary(microbenchmark)\n\n# Define the original function\nz_original <- function(x) scale(x)^2\n\n# Define the optimized function\nz_optimized <- function(x) x^2 / var(x)\n\n# Generate a sample vector\nset.seed(123)\nx <- rnorm(100000)\n\n# Run the benchmark\nbenchmark <- microbenchmark(\n  original = z_original(x),\n  optimized = z_optimized(x),\n  times = 100\n)\n\n# Print the results\nprint(benchmark)\n```\n\nRunning this benchmarking code will output a table showing the average execution times for both functions, demonstrating the improved performance of the optimized code."

### codeConverter:

This is a basic example which shows you how to translate your code.

``` r
codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
```

    [1] "Here's the equivalent Python code for the given R function:\n\n```python\nimport numpy as np\n\ndef z(x):\n    \"\"\"\n    Compute the squared standardized value of a given input vector x.\n    \n    Parameters:\n    x (array-like): Input vector to be standardized and squared.\n    \n    Returns:\n    array-like: The squared standardized values of the input vector.\n    \"\"\"\n    return (x - np.mean(x))**2 / np.var(x)\n```\n\nHowever, the function can be simplified and made more efficient using NumPy's `std` function, which directly calculates the standard deviation, as shown in the following alternative implementation:\n\n```python\nimport numpy as np\n\ndef z(x):\n    \"\"\"\n    Compute the squared standardized value of a given input vector x.\n    \n    Parameters:\n    x (array-like): Input vector to be standardized and squared.\n    \n    Returns:\n    array-like: The squared standardized values of the input vector.\n    \"\"\"\n    return ((x - np.mean(x)) / np.std(x))**2\n```\n\nThis is equivalent to the original R code using the `scale()` function with default parameters, which has a center argument set to `TRUE` and a scale argument set to `TRUE`."

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
[1] "A suitable, memorizable, short variable name in camelCase for the result of the function `function(x) scale(x)^2` could be `squaredScaledX`. However, in the interest of brevity, I would suggest `xSqSc` or simply `xss`. However, the latter might be a bit cryptic. Considering math context, we could name it as `xSigmaSq` - a combination of sigma from scaled, and Sq from squared.\n\nHere is another longer, more mathematical, precise name: `chiSquaredVars`. however this is specific to stats package where scale is mostly used."
```

## ‘Groq’ Model Arguments

The model parameters can be adjusted by passing functional arguments.

- `text` or `code`: The text or code input required for processing by
  ‘Groq’. If omitted, ‘Groq’ will utilize the content currently held in
  the clipboard.

- `GROQ_API_KEY`: The ‘Groq API’ key. By default it is set to
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
  ‘API’. The total number of tokens requested in max_tokens plus the
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

- `proxy`: Default value is NULL. To execute ‘Groq’ queries via a proxy
  server, specify the proxy address and port as an argument to the
  function instance. Use the following format:
  `"proxy_address:proxy_port"`. An example would be:
  `"81.94.255.13:8080"`

- `returnType`: Default is 3, which returns the output to the clipboard
  and returns TRUE, type 2 is unchanged and type 1 cats the output.
