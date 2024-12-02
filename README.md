
<!-- README.md is generated from README.Rmd. Please edit that file -->

# groqR <a href="https://github.com/GabrielKaiserQFin/groqR"><img src="man/figures/logo.png" align="right" height="138" /></a>

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
[1] "Large language models (LLMs) - a fascinating topic. As someone with a background in computer science, statistics, and mathematics, I have a deep appreciation for these models.\n\nLarge language models have revolutionized the field of Natural Language Processing (NLP) in recent years. They have demonstrated impressive capabilities in understanding and generating human language, opening up new avenues for applications in areas such as language translation, text summarization, chatbots, and even creative writing.\n\nFrom a technical standpoint, LLMs are typically trained using massive amounts of text data, which enables them to learn complex patterns and relationships within language. The architecture of these models is usually based on transformer networks, which are particularly well-suited for modeling sequential data like text.\n\nSome of the key strengths of LLMs include:\n\n1. **Scalability**: LLMs can be trained on vast amounts of data, which allows them to learn and adapt to a wide range of linguistic patterns and styles.\n2. **Flexibility**: These models can be fine-tuned for specific tasks and domains, enabling them to perform well in a variety of applications.\n3. **Contextual understanding**: LLMs have shown impressive abilities in understanding the context of text, including nuances like humor, sarcasm, and idioms.\n\nHowever, as with any powerful technology, there are also limitations and challenges associated with LLMs. Some of the key concerns include:\n\n1. **Bias and fairness**: LLMs can perpetuate biases and discriminatory language patterns present in the training data.\n2. **Explainability**: Understanding how LLMs arrive at their decisions can be challenging, which can make it difficult to trust their outputs.\n3. **Robustness**: LLMs can be vulnerable to adversarial attacks, which can compromise their performance.\n\nFrom a mathematical and statistical perspective, LLMs rely heavily on concepts like:\n\n1. **Probabilistic modeling**: LLMs use probability distributions to model the likelihood of different words or sequences of words in a given context.\n2. **Optimization techniques**: LLMs are trained using optimization algorithms like stochastic gradient descent (SGD) and Adam, which enable them to learn from large datasets.\n3. **Information theory**: LLMs rely on concepts like entropy and information gain to quantify the uncertainty and relevance of text.\n\nOverall, I believe that large language models have the potential to revolutionize many areas of human endeavor, from language translation and text analysis to creative writing and customer service. However, it's essential to address the challenges and limitations associated with these models to ensure that they are developed and used responsibly."
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
[1] "I'm happy to assist, but the provided text only consists of one sentence. However, I will rewrite it in a more polished and formal tone while maintaining its original language.\n\n\"Dear Recipient, I hope this message finds you well.\"\n\nIf you'd like, here's an example of a rewritten and expanded version that can be used in a more comprehensive message:\n\n\"Dear Recipient,\n\nI hope this message finds you well. I am writing to [insert the purpose of the message, addressing the recipient by their title and last name if possible]. Please find below [briefly outline the main points or the objective of your correspondence]. I look forward to the opportunity to discuss this matter further and explore potential avenues for [insert relevant outcome or objective].\n\nBest regards,\n[Your Name]\"\n\nIf you could provide the complete text you'd like me to revise, I'd be more than happy to assist you in rephrasing it with a professional tone."
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
[1] "Estimado/a destinatario/a, \n\nEspero que este mensaje le encuentre bien.\n\n(Note: In Spanish, the word order is somewhat flexible, so we can also translate it as: \n\nEstimado/a destinatario/a, espero que este mensaje le encuentre bien.)\n\nOr more formally:\n\nEstimado/a destinatario/a, \n\nLe deseamos que este mensaje le encuentre con buena salud y bienestar.\n\nHowever the direct translation is the first one"
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    [1] "```r\n# Define a squared scaling function\nz <- function(x) # takes input x\n  scale(x) # standardizes input\n  ^ 2 # squares the result\n```"

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    [1] "Here's a complete test file using testthat 3e (version 3.0.0 or above). This test file includes test cases to verify that the function `z` behaves as expected.\n\n```r\n# File: test_z_function.R\n\n# Load the necessary libraries\nlibrary(testthat)\n\n# Source the function z()\nsource(\"z_function.R\")\n\n# Test suite for the function z()\ncontext(\"z function tests\")\n\ntest_that(\"z() returns an object of correct dimensions\", {\n  # Test case 1: Test with a single numeric input\n  expect_equal(NROW(z(c(1, 2, 3))), 1)\n  \n  # Test case 2: Test with multiple numeric inputs\n  expect_equal(NCOL(z(c(1, 2, 3, 4, 5, 6))), 1)\n  \n  # Test case 3: Test with matrix input\n  expect_equal(dim(z(matrix(1:9, nrow = 3))), c(3, 1))\n})\n\ntest_that(\"z() correctly computes the squared scaled values\", {\n  # Test case 1: Test with a single numeric input\n  expect_equal(z(c(1)), (1 - mean(c(1)))^2 / (sd(c(1))^2))\n  \n  # Test case 2: Test with multiple numeric inputs\n  expect_equal(z(c(1, 2, 3)), (c(1, 2, 3) - mean(c(1, 2, 3)))^2 / (sd(c(1, 2, 3))^2))\n  \n  # Test case 3: Test with zero variance (avoid NaN values)\n  expect_equal(z(c(1, 1, 1)), (c(1, 1, 1) - mean(c(1, 1, 1)))^2 / (sd(c(1, 1, 1))^2 + 1e-15))\n})\n\ntest_that(\"z() raises an error for non-numeric inputs\", {\n  # Test case 1: Test with character input\n  expect_error(z(\"a\"), class = \"error\")\n  \n  # Test case 2: Test with factor input\n  expect_error(z(factor(c(1, 2, 3))), class = \"error\")\n  \n  # Test case 3: Test with list input\n  expect_error(z(list(1, 2, 3)), class = \"error\")\n})\n```\n\nIn this example, I have assumed that the `z` function is stored in a file called `z_function.R` that contains the original code:\n\n```r\n# File: z_function.R\n\nz <- function(x) {\n  scale(x)^2\n}\n```"

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    [1] "**Code Review**\n\nThe code snippet provided appears to be written in R programming language. Upon reviewing the code, I found a few issues and potential bugs:\n\n### Syntax Error\n\n* The `scale(x)2` expression seems to be attempting to square the scaled values of `x`. However, it is missing a multiplication operator between `scale(x)` and `2`. In R, to exponentiate a value, you need to use the `^` operator or multiply using the `*` operator.\n\nCorrected expression: `scale(x) ^ 2` or `scale(x) * scale(x)`.\n\n### Function Definition\n\n* While the function is defined correctly, it would be more readable to add a description and comments to explain what the function does.\n\n### Error Handling\n\n* The function does not handle potential errors that may occur during execution. For example, if `x` is not numeric, the `scale()` function will return an error.\n\n### Returning the Result\n\n* The function implies it is returning the scaled and squared values, but a return statement is not explicitly specified.\n\n### Vectorized Operations\n\n* If `x` is a vector, the `scale()` function will scale each element separately. However, the expression `scale(x) ^ 2` will not throw an error, as R supports vectorized operations.\n\n### Complete Code with Corrections\n\nHere is the corrected and improved version of the code:\n\n```r\n# Define a function to scale and square a given vector\nz <- function(x) {\n  # Check if x is numeric\n  if (!is.numeric(x)) {\n    stop(\"Input must be numeric\")\n  }\n  \n  # Scale and square the input vector\n  scaled_x <- scale(x)\n  return(scaled_x^2)\n}\n```\n\n**Example Use Case:**\n\n```r\n# Generate a random vector\nset.seed(123)\nx <- rnorm(10)\n\n# Call the function with the vector as input\nresult <- z(x)\n\n# Print the result\nprint(result)\n```"

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    [1] "```r\n# Define a function z that calculates the squared scaled value of input x.\n#\n# The function utilizes the scale() function from R to standardize the input data\n# by subtracting the mean and dividing by the standard deviation for each column.\n# It then squares the scaled values.\n#\n# @param x A numeric vector or matrix.\n# @return A numeric vector or matrix of same dimensions as x, where each value is \n#         the squared scaled value of the corresponding input.\n# @examples\n# # Create sample data\n# x <- matrix(rnorm(100), nrow = 10)\n#\n# # Apply function z\n# z_value <- z(x)\n#\n# # Print the result\n# print(z_value)\n\nz <- function(x) {\n  # Check if input x is numeric\n  stopifnot(is.numeric(x))\n  \n  # Calculate the squared scaled value of input x\n  z_value <- scale(x)^2\n  \n  # Return the calculated value\n  return(z_value)\n}\n```"

### coder:

This is a basic example which shows you how to finish your code by
‘Groq’.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    [1] "Here's a possible completion of the function using R:\n\n```r\n# A function to scale a vector and square the resulting z-score\nz2 <- function(x) {\n  # Calculate the mean of x\n  x_mean <- mean(x)\n  \n  # Calculate the standard deviation of x\n  x_sd <- sd(x)\n  \n  # Calculate the z-score for x\n  z_score <- (x - x_mean) / x_sd\n  \n  # Square the z-score\n  squared_z_score <- z_score^2\n  \n  return(squared_z_score)\n}\n\n# Example usage:\nx <- rnorm(100, mean = 10, sd = 2)\nresult <- z2(x)\nprint(result)\n```\n\nThis function takes a vector `x`, calculates the z-score for each element, and returns the squared z-scores. It assumes that the input vector `x` is numeric and not empty. \n\nPlease note that in some cases (when `x` has zero variance, i.e., all elements are the same), `sd(x)` can be zero, and division by zero will cause an error when calculating `z_score`. You may want to add some error checking if you're working with data that might have zero variance."

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    [1] "**Optimized R Code**\n\nThe existing code defines a function `z` that scales a numeric vector `x` by centering it around the mean and standardizing to unit variance, then squares each element. Here's an optimized version:\n\n```r\nz <- function(x) (x - mean(x)) / sd(x) / sqrt(n - 1))^2\n```\n\nHowever, this might not necessarily be faster in practice than the original, since `scale()` internally calculates the standard deviation correctly (divided by `sqrt(n - 1)`), whereas the `/ sd(x)` division would calculate it divided by `sqrt(n)` ( population sd), so if we stick to population definition:\n\n```r\nz <- function(x) (x - mean(x))^2 / (n * var(x))\n```\n\nIn general, the best version depends on whether your `x` values have are representing sampling result (if so use population definition with n-1, alternatively version) or full population set (n version). \n\n**Note**: `n` is the number of elements in the vector `x` and can also be obtained by `length(x)`. If you expect most functions to have at least one `x` (commonly applied requirement), consider setting it by `n <- length(x)` ."

### codeConverter:

This is a basic example which shows you how to translate your code.

``` r
codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
```

    [1] "Here's the equivalent Python code using the NumPy library:\n\n```python\nimport numpy as np\n\ndef z(x):\n    return np.square(np.scale(x))\n```\n\nHowever, `np.scale` is not a valid function in NumPy, and the equivalent function to R's `scale` would be `(x - np.mean(x)) / np.std(x)`. So the correct Python function should be:\n\n```python\nimport numpy as np\n\ndef z(x):\n    return np.square((x - np.mean(x)) / np.std(x))\n```\n\nYou could also use a StandardScaler from the scikit-learn library:\n\n```python\nfrom sklearn.preprocessing import StandardScaler\nimport numpy as np\n\ndef z(x):\n    scaler = StandardScaler()\n    return np.square(scaler.fit_transform(x.reshape(-1, 1)).ravel())\n```"

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
[1] "Considering the given function that scales a value and then squares it, here are a few variable name suggestions that follow the camelCase convention:\n\n1. scaledSquared - This name is straightforward, describing the operation performed by the function.\n2. transformedX - This name implies that the input value x has undergone a transformation, which is the case here.\n3. scaledThenSquared - This is similar to the first suggestion but includes 'Then' to emphasize the sequence of operations.\n\nHowever, I would suggest the most concise and memorable option:\n\n- sqScale\n\nThis name \"sqScale\" combines the ideas of both squaring and scaling into a single, short, and easily memorable variable name."
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
