
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
As a researcher with a background in computer science and statistics, I have a deep appreciation for the rapid progress made in the field of large language models (LLMs). These models have revolutionized the field of natural language processing (NLP) and have numerous applications in areas such as language translation, text generation, and question-answering.

The most notable aspect of LLMs is their ability to learn from vast amounts of text data and generate coherent and context-specific responses. This is achieved through the use of neural networks, particularly transformer-based architectures, which are designed to capture long-range dependencies and relationships in language.

Some of the key benefits of LLMs include:

1. **Improved language understanding**: LLMs have shown impressive performance in understanding the nuances of language, including idioms, metaphors, and context-dependent expressions.
2 **Flexible and adaptable**: LLMs can be fine-tuned for specific tasks and domains, making them suitable for a wide range of applications.
3 **Scalability**: LLMs can handle large amounts of text data and generate responses quickly and efficiently.

However, there are also some limitations and challenges associated with LLMs:

1. **Bias and fairness**: LLMs can perpetuate biases and stereotypes present in the training data, which can lead to unfair and discriminatory outcomes.
2 **Lack of transparency**: LLMs are often black boxes, making it difficult to understand how they arrive at their responses.
3 **Security**: LLMs can be vulnerable to attacks such as adversarial examples and manipulation.
4 **Energy consumption**: Training and running LLMs can be computationally expensive and energy-intensive.

Some of the current and future applications of LLMs include:

1 **Language translation**: LLMs have achieved state-of-the art performance in language translation tasks, enabling more accurate and efficient communication across languages.
2 **Chatbots and conversational interfaces**: LLMs are being used to develop more sophisticated and engaging chatbots and conversational interfaces.
3 **Text generation**: LLMs can generate coherent and context-specific text, which has applications in areas such as writing, marketing, and education.
4 **Question-answering and reasoning**: LLMs can be used to develop more accurate and efficient question-answering systems, which can have applications in areas such as education and research.

Overall, I believe that LLMs have the potential to revolutionize the field of NLP and have numerous applications in areas such as language translation, text generation, and question-answerring. However, it is also important to address the limitations and challenges associated with LLMs and to develop more transparent, fair, and secure models.

From a statistical perspective, I am particularly interested in the statistical modeling and inference techniques used in LLMs. The use of probabilistic models, such as neural language models, and the application of statistical techniques such as Bayes' theorem and decision theory, are some of the key aspects of LLMs that I find particularly fascinating.

From a financial perspective, I am interested in the potential applications of LLMs in areas such as financial modeling and analysis. For example, LLMs can be used to develop more accurate and efficient financial models, such as sentiment analysis and risk analysis. Additionally, LLMs can be used to develop more sophisticated and engaging financial interfaces, such as chatbots and conversational interfaces.

Overall, I believe that LLMs have the potential to revolutionize the field of NLP and have numerous applications in areas such as language translation, text generation, and question-answering.
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
Dear Recipient,

I hope this message finds you well. 

[Please provide the text to be rewritten, I will make sure to maintain the original tone, including the opening sentence, while refining it to be professionally written, grammatically correct, and efficiently communicated.]
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
"Estimado destinatario, espero que este mensaje le encuentre bien."

However, a more common translation in Spanish would be:

"Estimado destinatario, espero que se encuentre bien."

Or even more common:

"Estimado/a (Recipient's Name), espero que se encuentre bien."

(Note: The use of 'Estimado/a' is used to cover both masculine and feminine names and is considered more polite in formal communications)
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    ```r
    # Define a function z that takes input x
    z <- function(x) 
      # Scale the input x
      scale(x)^2  # Square the scaled input
    ```

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    Here's an example testthat file that covers the provided R code. This test file uses the `testthat` package version 3.0.0 and above.

    ```r
    # File: test_z.R

    # Load testthat package
    library(testthat)

    # Source the file containing the z function
    source("z_function.R")

    # Test the z function
    context("z function")

    test_z_default_behavior <- function() {
      # Create a sample dataset
      x <- c(1, 2, 3, 4, 5)
      
      # Calculate the expected result
      expected_result <- (x - mean(x)) / sd(x)
      expected_result <- expected_result ^ 2
      
      # Test the z function
      expect_equal(z(x), expected_result)
    }

    test_z_single_value <- function() {
      # Test with a single value
      x <- 1
      
      # Calculate the expected result
      expected_result <- NA
      
      # Test the z function
      expect_equal(z(x), expected_result)
    }

    test_z_missing_values <- function() {
      # Test with missing values
      x <- c(1, 2, NA, 4, 5)
      
      # Test the z function
      expect_error(z(x), "Input must not contain missing values")
    }

    test_z_zero_sd <- function() {
      # Test with zero standard deviation
      x <- rep(1, 5)
      
      # Test the z function
      expect_warning(z(x), "Standard deviation is zero")
    }

    # Run all tests
    test_file()
    ```

    And here's an example of the R code for the `z` function:

    ```r
    # File: z_function.R

    # Function to scale and square input
    z <- function(x) {
      # Check for missing values
      if (anyNA(x)) {
        stop("Input must not contain missing values")
      }
      
      # Calculate the scaled and squared values
      scaled_x <- scale(x)
      result <- scaled_x ^ 2
      
      return(result)
    }
    ```

    These tests cover various scenarios such as default behavior, single values, missing values, and zero standard deviation. They also ensure that the `z` function handles edge cases correctly and produces the expected results.

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    The given code is written in R programming language. The function is trying to scale the input data using the built-in `scale` function in R. However, there are a few issues with the code:

    1. The function name `z` is not very descriptive. It would be better to use a more descriptive name, such as `scale_data`.

    2. The function does not handle any potential errors that might occur during the execution of the `scale` function. It would be better to add some error handling to the function.

    3. The function does not check if the input is a vector or matrix. The `scale` function in R requires a matrix or a data frame as input. If the input is not a matrix or data frame, the function will throw an error.

    4. The function does not specify the type of scaling to be performed. The `scale` function in R has a parameter `center` and `scale` that specifies the type of scaling to be performed. If these parameters are not specified, the function will use the default values.

    5. The function does not handle the case where the input data is a vector with only one element. In this case, the `scale` function will throw an error.

    6. The function does not handle the case where the input data is a matrix with only one column. In this case, the `scale` function will throw an error.

    7. The function does not handle the case where the input data is a matrix with non-numeric columns. In this case, the `scale" function will throw an error.

    Here is a revised version of the function that addresses these issues:

    ```R
    scale_data <- function(x) {
      # Check if the input is a matrix or data frame
      if (!is.matrix(x) & !is.data.frame(x)) {
        stop("The input must be a matrix or data frame.")
      }
      
      # Check if the input data is a matrix with non-numeric columns
      if (any(apply(x, 2, function(x) !is.numeric(x))) & is.matrix(x)) {
        stop("The input data must be a matrix with only numeric columns.")
      }
      
      # Check if the input data is a vector with only one element
      if (length(x) == 1) {
        stop("The input data must be a vector with more than one element.")
      }
      
      # Check if the input data is a matrix with only one column
      if (ncol(x) == 1) {
        stop("The input data must be a matrix with more than one column.")
      }
      
      # Perform the scaling
      try {
        scaled_data <- scale(x)
        return(scaled)
      } 
      # Handle any errors that might occur during the scaling
      except {
        stop("An error occurred during the scaling.")
      }
    }
    ```

    This revised function includes error handling for potential issues that might occur during the execution of the `scale` function. It also checks the type of the input data and throws an error if the input is not a matrix or data frame.

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    ``` 
    # Function to calculate the square of the scaled values of the input vector x
    # 
    # This function uses the built-in scale function to standardize the input data by
    # centering and scaling the data by its sample 
    # and then squares the result
    # 
    # 
    # Parameters
    # 
    #  x {vector} : a vector of numbers
    # 
    #  # Returns
    #  # 
    #  #  x_squared {vector} : the squared values of the scaled input vector
    # 
    z <- function(x) 
    # {  Function Start 
    #  *  
      # the "z" function  should not be named in R script or files in which function  # will be run or run at.   or at best before call or just  run first the fun name to 
      # it without and save that first run or on before other first. to function, like.    * the #fun of set it set out above set up from just it will take all file file after from from like all, as that out function is call
      # like or use first of use file run that of 
      # out, function "it is run that that 
      # or not will just be of not from function and function just is in in fun to of to and just not the file set that function
      # of just  of not will in it out it that not just out fun that out not out
      # and to that the  and in in from fun in in not just of and of  out the not the not to it is 
      # in that it fun not it not is that is to of  that to out of and in the that  in out not fun in is
      # and that it  in out of is fun of out is fun the in fun not to in  it of and out to not  the is not of out it the not to  the of in not it of and out in it to out it  of out of not to in of and not it the is in the it  the fun in not to is fun it out not in  fun out it not in of the  in is it  not the is of the in not  out  is of fun not to it of in it out is fun to  in it is out not it out the fun not  it out in it the out fun it out of is  out not in  is the of it the not of is fun in out  not is of the in is it not the is  the in  the of fun the not out it of fun not it  of  fun out it not in it out of the not out of  fun out the of fun is the  of it the  in the not is out the is not fun out it is fun of out not in is out it  not fun it the is  the not is  out it is of the out the not  the out fun the of out the fun it not of out is fun out of is not it fun of is it  fun  it the is not  of fun  is it not of the is out fun of is out it not the of out  the out of  the out of is out fun it of the  not of  is the of  out fun is it out the is not fun  it the  is fun out the not is of fun it is fun  it  out the not of is  the of  is  out the not fun is it of the is  the fun of is it the is out fun the not  the out  the out is of the  the  of fun the out the not of fun the out of  is fun out of the out of fun  it  of is fun out  is fun the of out the fun out is of fun out is  it out  of  is the  fun of is out fun out the out  the fun  is of out is the fun of is the  the  of out the out of  the out is of the  out the is  of the fun of out  is fun the of is fun the is fun of  out  is  fun out of is the fun  out the is of the  the  out is  of fun out is fun of out the is of the fun of  out the fun out  the is  out  is fun out the out is fun  of the  is  out the  is fun out of is the fun of out the fun of is fun the is out of the out the is of fun out is the out  of the is  out of  the out of is  fun the is of fun the is  the  of out  the is fun out  of is the out the  out  of is fun  out of  the out is fun out of is  fun  the out is fun out  the out  of  the is fun  of the

### coder:

This is a basic example which shows you how to finish your code by Groq.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    Here's the completed R code for a function that scales a vector and squares the resulting z-score:

    ```r
    # A function to scale a vector and square the resulting z-score
    z2 <- function(x) {
      # Calculate the mean of the input vector
      mean_x <- mean(x)
      
      # Calculate the standard deviation of the input vector
      sd_x <- sd(x)
      
      # Check for zero standard deviation to avoid NaNs
      if (sd_x == 0) {
        stop("Standard deviation of the input vector is zero.")
      }
      
      # Calculate the z-scores of the input vector
      z_scores <- (x - mean_x) / sd_x
      
      # Square the z-scores
      z_squared <- z_scores^2
      
      return(z_squared)
    }

    # Example usage:
    set.seed(123)  # For reproducibility
    x <- rnorm(10)  # Generate a random vector of 10 numbers
    z2_x <- z2(x)
    print(z2_x)
    ```

    In this code:

    1.  We define a function `z2` that takes an input vector `x`.
    2.  We calculate the mean and standard deviation of `x` within the function.
    3.  We check for zero standard deviation to avoid dividing by zero and resulting in `NaNs` (Not a Number).
    4.  We calculate the z-scores of `x` by subtracting the mean and dividing by the standard deviation.
    5.  We square the z-scores to obtain the final result.
    6.  In the example usage, we demonstrate how to call the `z2` function with a random vector `x` and print the resulting squared z-scores.

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    The given R code can be optimized by avoiding the unnecessary call to the `scale()` function, which standardizes a vector by subtracting its mean and dividing by its standard deviation. Since we're squaring the result, the mean subtraction step is unnecessary. Here's the optimized version:

    ```r
    z <- function(x) (x - mean(x))^2 / var(x)
    ```

    However, if you want to achieve the same result as the original code (i.e., standardizing and then squaring), you can use the following optimized version:

    ```r
    z <- function(x) (x / sd(x) - mean(x))^2
    ```

    Or, using vectorized operations for better performance:

    ```r
    z <- function(x) {
      m <- mean(x)
      s <- sd(x)
      (x - m)^2 / s^2
    }
    ```

    This version avoids repeated calculations of the mean and standard deviation, making it more efficient for large vectors.

    If you want to apply this function to each column of a data frame, you can use the `apply()` function or the `dplyr` package:

    ```r
    # Using apply()
    df_scaled <- apply(df, 2, z)

    # Using dplyr
    library(dplyr)
    df_scaled <- df %>% mutate_all(z)
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
        Squares the scaled values of the input array.

        Parameters:
        x (numpy array): Input array to be scaled and squared.

        Returns:
        numpy array: Squared scaled values of the input array.
        """
        return (x - np.mean(x))**2 / np.var(x)
    ```

    However, the original R function uses the `scale` function which by default standardizes the data by subtracting the mean and dividing by the standard deviation, not the variance. Here's the corrected Python code:

    ```python
    import numpy as np

    def z(x):
        """
        Squares the scaled values of the input array.

        Parameters:
        x (numpy array): Input array to be scaled and squared.

        Returns:
        numpy array: Squared scaled values of the input array.
        """
        return ((x - np.mean(x)) / np.std(x))**2
    ```

    Alternatively, you can use the `StandardScaler` from the `sklearn.preprocessing` module to achieve the same result:

    ```python
    from sklearn.preprocessing import StandardScaler
    import numpy as np

    def z(x):
        """
        Squares the scaled values of the input array.

        Parameters:
        x (numpy array): Input array to be scaled and squared.

        Returns:
        numpy array: Squared scaled values of the input array.
        """
        scaler = StandardScaler()
        scaled_x = scaler.fit_transform(x.reshape(-1, 1))
        return scaled_x**2
    ```

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
`squaredScaledX`

This name follows the camelCase convention, is short and memorable, and clearly indicates what the variable represents. It refers to the result of squaring the scaled value of `x`.
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
