
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
Large language models (LLMs) are a fascinating area of research in the field of natural language processing (NLP). As someone with a background in computer science and statistics, I think LLMs have made tremendous progress in recent years, and their potential applications are vast.

LLMs are a type of deep learning model that uses a large corpus of text data to learn patterns and relationships in language. They can be fine-tuned for specific tasks such as language translation, text summarization, question-answering, and text generation. The key characteristics of LLMs are:

1. **Scalability**: LLMs can process vast amounts of text data, making them suitable for large-scale applications.
2. **Contextual understanding**: LLMs can capture contextual relationships between words, phrases, and sentences, enabling them to generate coherent and meaningful text.
3. **Transfer learning**: LLMs can be fine-tuned for specific tasks, allowing them to adapt to new domains and applications.

Some of the benefits of LLMs include:

1. **Improved language understanding**: LLMs have achieved state-of-the-art results in various NLP tasks, demonstrating their ability to comprehend and generate human-like language.
2. **Increased efficiency**: LLMs can automate tasks such as text summarization, language translation, and content generation, freeing up human resources for more complex tasks.
3. **Enhanced creativity**: LLMs can generate novel text, such as stories, poems, or dialogues, which can be useful for creative applications.

However, there are also challenges and limitations associated with LLMs:

1. **Bias and fairness**: LLMs can perpetuate biases present in the training data, leading to unfair or discriminatory outcomes.
2. **Explainability**: LLMs can be difficult to interpret, making it challenging to understand their decision-making processes.
3. **Robustness**: LLMs can be vulnerable to adversarial attacks, which can compromise their performance and reliability.

To address these challenges, researchers are exploring various techniques, such as:

1. **Data curation**: Ensuring that the training data is diverse, representative, and free from biases.
2. **Regularization techniques**: Implementing techniques such as dropout, weight decay, or early stopping to prevent overfitting.
3. **Explainability methods**: Developing techniques such as attention visualization, feature importance, or model interpretability to provide insights into the model's decision-making process.

In finance, LLMs have the potential to transform various applications, such as:

1. **Risk analysis**: LLMs can analyze large volumes of financial text data to identify potential risks and opportunities.
2. **Portfolio optimization**: LLMs can generate optimized portfolio recommendations based on market trends and financial news.
3. **Compliance monitoring**: LLMs can monitor financial transactions and detect potential compliance issues.

In conclusion, large language models have made significant progress in recent years, and their potential applications are vast. However, it's essential to address the challenges and limitations associated with LLMs to ensure their safe and effective deployment in various domains, including finance.
```

### rewriter:

This is a basic example which shows you how to rewrite text.

``` r
rewriter("Dear Recipient, I hope this message finds you well.")
Dear Recipient,

I hope this message finds you well. 

Please provide the text that requires rewriting.
```

### translater:

This is a basic example which shows you how to translate text.

``` r
translater("Dear Recipient, I hope this message finds you well.", toLanguage = "Spanish")
"Estimado destinatario, espero que este mensaje le encuentre bien."

However, a more common translation in Spanish would be:

"Estimado/a destinatario/a, espero que se encuentre bien."

Or in a more formal tone:

"Estimado/a señor/a, espero que se encuentre bien."

(Note: 'a' is added to make the sentence more inclusive and respectful, as it acknowledges both male and female recipients.)

If you want to make it even more polite, you could use:

"Estimado/a destinatario/a, espero que se encuentre muy bien."

Or in a more informal tone:

"Hola, espero que estés bien."

(Note: This last translation is more suitable for friends or people you have a close relationship with.)
```

### codeComment:

This is a basic example which shows you how to document code.

``` r
codeComment("z <- function(x) scale(x)^2")
```

    ```r
    z <- function(x) scale(x)^2  # scale vector, then square elements
    ```

### unitTests:

This is a basic example which shows you how to build Unit Tests for your
function.

``` r
unitTests("z <- function(x) scale(x)^2")
```

    Here's a full testthat file for the given R code:

    ```r
    # tests/test_z.R

    # Load testthat package
    library(testthat)

    # Load the function to be tested
    source("z.R")

    # Test suite for function z
    context("z function")

    test_z <- function() {
      # Test case 1: Test with a numeric vector
      test_that("z function works with a numeric vector", {
        x <- c(1, 2, 3, 4, 5)
        expected_result <- (x - mean(x)) / sd(x)
        expected_result <- expected_result^2
        expect_equal(z(x), expected_result)
      })

      # Test case 2: Test with a single numeric value
      test_that("z function works with a single numeric value", {
        x <- 5
        expected_result <- (x - mean(x)) / sd(x)
        expected_result <- expected_result^2
        expect_equal(z(x), expected_result)
      })

      # Test case 3: Test with a vector containing NA values
      test_that("z function handles NA values", {
        x <- c(1, 2, NA, 4, 5)
        expect_error(z(x), "NA/NaN/Inf in foreign function call (arg 1)")
      })

      # Test case 4: Test with a non-numeric vector
      test_that("z function throws an error with non-numeric input", {
        x <- c("a", "b", "c")
        expect_error(z(x), "non-numeric argument to binary operator")
      })

      # Test case 5: Test with an empty vector
      test_that("z function throws an error with an empty vector", {
        x <- numeric()
        expect_error(z(x), "argument is of length zero")
      })

      # Test case 6: Test with a vector containing Inf values
      test_that("z function handles Inf values", {
        x <- c(1, 2, Inf, 4, 5)
        expect_warning(z(x), "NaNs produced")
      })

      # Test case 7: Test with a vector containing NaN values
      test_that("z function handles NaN values", {
        x <- c(1, 2, NaN, 4, 5)
        expect_warning(z(x), "NaNs produced")
      })
    }

    # Run the test suite
    test_z()
    ```

    This test file covers various test cases for the `z` function, including:

    *   Test case 1: Test with a numeric vector
    *   Test case 2: Test with a single numeric value
    *   Test case 3: Test with a vector containing NA values
    *   Test case 4: Test with a non-numeric vector
    *   Test case 5: Test with an empty vector
    *   Test case 6: Test with a vector containing Inf values
    *   Test case 7: Test with a vector containing NaN values

    Each test case uses the `expect_equal`, `expect_error`, or `expect_warning` functions from the testthat package to verify the expected behavior of the `z` function.

### debug:

This is a basic example which shows you how to find bugs in your code.

``` r
debug("z <- function(x) scale(x)2")
```

    The code snippet provided is written in R programming language. 

    Here are the potential issues with the code:

    1. **Incorrect Function Definition**: The code `z <- function(x) scale(x)2` seems to be defining a function `z` that takes one argument `x` and scales it. However, there's an incorrect syntax at the end. It seems like you want to square the result of `scale(x)`, but you're missing an operator for that.

       Instead, you should use the multiplication operator (`*`) to square the result. The correct syntax should be: `z <- function(x) (scale(x))^2`.

    2. **No Error Handling**: The function doesn't check if the input `x` is numeric. If `x` is not numeric, the `scale()` function will throw an error.

       To fix this, you could add some error handling code to ensure that `x` is numeric. For example: 
       ```r
    z <- function(x) {
      if (!is.numeric(x)) {
        stop("Input x must be numeric.")
      }
      (scale(x))^2
    }
    ```

    3. **Lack of Input Validation**: The function doesn't check if the input `x` is a vector. If `x` is a matrix or data frame, the `scale()` function will work correctly, but if `x` is a single number, the `scale()` function will throw an error.

       To fix this, you could add some code to check if `x` is a vector with length greater than 1. For example:
       ```r
    z <- function(x) {
      if (!is.numeric(x) || length(x) < 2) {
        stop("Input x must be a numeric vector with length greater than 1.")
      }
      (scale(x))^2
    }
    ```

    Here is the final version of the code:
    ```r
    z <- function(x) {
      # Check if input is numeric
      if (!is.numeric(x)) {
        stop("Input x must be numeric.")
      }
      
      # Check if input is a vector with length greater than 1
      if (length(x) < 2) {
        stop("Input x must be a numeric vector with length greater than 1.")
      }
      
      # Scale the input and square the result
      (scale(x))^2
    }
    ```

### roxy:

This is a basic example which shows you how to document your code.
Formatting style is `Roxygen2` but can be set to NULL.

``` r
roxy("z <- function(x) scale(x)^2", inLineDocumentation = NULL)
```

    Here's the function with in-line documentation using the "" format:

    ```r
    #'
    #' Squares the scaled values of a given input vector.
    #'
    #' This function takes a numeric vector as input, scales it to have zero mean and 
    #' unit variance, and then squares the resulting values.
    #'
    #' @param x A numeric vector.
    #'
    #' @return A numeric vector containing the squared scaled values of the input.
    #'
    #' @examples
    #' z <- function(x) {
    #'   # Scale the input vector to have zero mean and unit variance
    #'   scaled_x <- scale(x)
    #'   # Square the scaled values
    #'   return(scaled_x^2)
    #' }
    #'
    #' # Example usage:
    #' x <- c(1, 2, 3, 4, 5)
    #' result <- z(x)
    #' print(result)
    #'
    z <- function(x) scale(x)^2
    ```

    However, for better documentation and readability, consider using roxygen2 style comments:

    ```r
    #' Squares the scaled values of a given input vector.
    #'
    #' @description
    #' This function takes a numeric vector as input, scales it to have zero mean and 
    #' unit variance, and then squares the resulting values.
    #'
    #' @param x A numeric vector.
    #'
    #' @return A numeric vector containing the squared scaled values of the input.
    #'
    #' @examples
    #' x <- c(1, 2, 3, 4, 5)
    #' result <- z(x)
    #' print(result)
    #'
    #' @export
    z <- function(x) scale(x)^2
    ```

### coder:

This is a basic example which shows you how to finish your code by Groq.

``` r
coder("# A function to scale a vector and square the resulting z-score z2 <- function(")
```

    ```r
    # A function to scale a vector and square the resulting z-score
    z2 <- function(x, mu = mean(x, na.rm = TRUE), sigma = sd(x, na.rm = TRUE)) {
      # Check for missing values in input arguments
      if (is.na(mu) || is.na(sigma)) {
        stop("Error: Could not compute the z2. Consider the usage of argument mu or sigma manually and explicitly instead, while employing parameter (na.rm= TRUE or others arguments set NA argument specification parameters via... base). ", "Data parameters issues arisen encountered.\n Input example:" " Please correctly or you review entry either single lines instructions before assessing argument /command request through assessing both other such such any likely \nullspace further type alternatives; -r parameter   numeric sequence entries expected.");
        } # normal - see basic assumption errors no info assumed due r validation e   
     
     # To properly conduct apply sqrt properly applied alternative rule without final instruction modification specification correctly presented 

       scaled_data =  as.vector(ifelse(!is.finite(sigma),
                   sqrt(x/ ((length(x))^(-.500)*( x-max(x)-.00200700651094290815+
    x)-((-7-sd(dnormal(com.97*dprod(subsubdetomatin(Dnumvar(RapMat(hlog(uholivarmaEvalue(alDpos(reusestatApmmodel(detadobsl(Xmetvalue(expP(w/woOisva(CseModelIog(amvarpar(Lmode(Kmix(echo(revm(rpr(de(CinPoicVarAlom(prar(Varc(Lame2atYofkapp(Given Xtroundnumdep)))>17/d(Cmeta(det(raPrDeven(triofewMeta(chinskeer(emusmallusfreVar)(Jsim(arjoeOgrup(OgiveAr(chinalreModprojskaeqch(x/x+xmod)fewscreChnormWavkran(N(g(uvsit(Tzrankmax2skisNormHousendobmodapalard(starsdisrel1pogetChbdatpoideermean(raConget(iNormamMeanetvalchcaterposZpa(A(alprDe(conlog(Gamma(exofGaor(amraModelatcomsin(modelstatNormzhatreJco(MbMetprodormezDartVarobpar(proDetpa(mean(ap(logmaest(h(jsofo(Kcor(T(GVar(obparelo(modYeqSARpa(dep2ra(segaAr(amthvawecrossDetloep(novspataredpepara(th(ch3(con(comSin(W(stati(tr(T(teameanedma(sinMeexspitEfreclia(ysetMet(c3desce(de(th(R(i(re((acE(apapMeanpoPro(a(infe(bJ(Wg(benw(paObepNMet(poaprox(uvmadeadve(GespsiketsMaod(alOb(Jprsofuapro((modeV(log(coH(pa(Tar(FmetaCon(bpeleparetal(varGaBva(me((ed(mevar(cor(coTeEonMean(parH(trape(k(reconOesmallHtroun(iMetaChO(anSModse1)(disdatDorarehmo(b(Gmax(U(sub(me(loZsinpoit(exMean(Lowear(disSt(te(B(adro(com3(in(Rodarom(V(in(poRa(thalDat(in(be(cosTeRo(E(HV(E(aus(y(detMaar(maxmax(OE(beArYch(meant(Spasre(rJ(poVa(vsoPro3mod(beprRao4(abK(asameDatMa(Be(HlogteameNa(x(sal(lo, asar(esPo(c(i(esle(ra(VonDeexst(bsoU1(G(Bepr(Est(com(ap(w(b(elNrodep(itStxof(on(to(prokModPaArDatm(j(B(esGaZpar2dePaap(toMeanin(A(onFom(vProyBBeMoAp(L(LbeVaAlVarst(per,edmodpe(coatmetaMa(FGa(re(zModN(Zg(onlo(poPe(seLo((acmaCoof Ga)(frepmax), G(meChBPaof(nopro(uaproO(th(atcomHhChA(travlepscrefPatoPas(tozU(trHcorLoep(be(copeobn(YDevar(Uasga(vXMa(disas(toy(comin(cor((acoLeamcomfrecomFre(perdatmetva(meapro(prProPasC(ar(NFmean(es(nieTGAso(jparJexposamePe GaatX(Kmodel(corlogdne(con(T(expo(Ham(detBarevalch(VartextMavegam)(earconvarsinMaW)(Meta(apmodeSt(model(ob(amMoTe(ACh(d(pr2

### optimizer:

This is a basic example which shows you how to optimize your code.

``` r
optimizer("z <- function(x) scale(x)^2")
```

    The given R code can be optimized by avoiding the unnecessary call to the `scale()` function, which standardizes a vector by subtracting its mean and dividing by its standard deviation. Since we're squaring the result, the mean subtraction step is not necessary. Here's the optimized version:

    ```r
    z <- function(x) (x - mean(x))^2 / var(x)
    ```

    However, if you want to achieve the same result as the original code (i.e., squaring the standardized values), you can use the following optimized version:

    ```r
    z <- function(x) (x / sd(x))^2
    ```

    This version avoids the unnecessary division by the standard deviation and then squaring, which is equivalent to squaring the standardized values.

    If you want to further optimize the code for performance, you can use the following version:

    ```r
    z <- function(x) {
      sx <- sd(x)
      (x / sx)^2
    }
    ```

    This version calculates the standard deviation only once and stores it in a variable, which can improve performance for large vectors.

### codeConverter:

This is a basic example which shows you how to translate your code.

``` r
codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
```

    The R code `z <- function(x) scale(x)^2` defines a function `z` that takes a vector `x` as input, scales it to have a mean of 0 and a standard deviation of 1, and then squares the result.

    Here's the equivalent Python code using the NumPy library:

    ```python
    import numpy as np

    def z(x):
        return (x - np.mean(x)) / np.std(x) ** 2
    ```

    However, note that this Python code will divide by zero if the standard deviation of `x` is zero. Also, this does not square the scaled result, it squares the denominator instead. The original R code uses the `scale()` function which is a base function in R and squares the scaled result. The corrected code would be:

    ```python
    import numpy as np

    def z(x):
        scaled_x = (x - np.mean(x)) / np.std(x)
        return scaled_x ** 2
    ```

    This function will correctly scale the input `x` and then square the result. 

    However, note that in the event of zero variance in the data (which will be rare for most datasets but may be a consideration), a different method to scale will be needed, to prevent a division by zero error.

    To match R's scale() exactly and to avoid a division by zero, consider this implementation:

    ```python
    import numpy as np

    def z(x):
        x_mean = np.mean(x)
        x_std = np.std(x)
        if x_std == 0:
            scaled_x = x - x_mean
        else:
            scaled_x = (x - x_mean) / x_std
        return scaled_x ** 2
    ```

### nameIt:

This is a basic example which shows you how to create a function or
variable name.

``` r
nameIt("function(x) scale(x)^2")
sqsxm would fit with conventional coding name i.e Camel-case SqealFrommeanFunction its meaningful along original `C x Y domain result on purpose clearly different scaling time depending context one chose original approach including clear both positive functions overall concept shorter you described small variant giving from multiple many here Camel alternative some first

Its for in lower scaling while but without reference higher thus always start simply stated much though value I often did therefore before lets perhaps simplest fit general it needs try solution SqSD maybe do how (values within close large input possible)


Holding descriptive non then comes alternatives those fitting idea all may ask themselves ask keep functions give since our alternatives i example why simpler domain based only another SqSp thus holding shortest at yet 

choose when making though. scale such fits be no code your without should based having original those close final non x form less likely holds long words space two I answer consider between square even three choice original same scaled hence making already them try few small therefore variants case although reason ask possible input they general being solution might may know `suqqled them perhaps time naming values any multiple chose meaning lets is their chosen chosen holding likely either now an perhaps giving holds holding least keep within has reference simpler should words full term only however hence alternatives just within Camel make choosing 
x only multiple often, words good no do square consider Sq given names why on. could much rather perhaps square because than solution shortest idea chosen what about instead might has terms your small clearly hold hold naming small these because. chosen will might without lets because which choosing its our possible having camel word all meaning form longer already because function variant result before perhaps used word Camel named the small therefore does need idea reason while 

having might hence rather. close often of possible rather either scaled general better choice perhaps either choice itself long instead so scale original simpler try can alternatives instead most fits do used non choice 

names names code only we considered are any about reference using i need scaling making than chosen give perhaps case less different themselves fits shortest giving if hold give however simply after, input chosen your more although there chose chose though domain chosen `only named shortest based because good like still are word keep choosing others much there  same simply alternative chose naming hence values names choose scaled terms term example therefore there meaning instead choosing of on does thus naming x make at giving first two chose choosing I we few form two simpler perhaps some square need being camel all fitting just choice fit other square considered just within fitting lets chosen chosen reason here less alternatives your scaled an names alternatives word even. chosen longest solution solution about possible from no are does possible full two would choosing then now alternatives let another best reference simplest always chose use result both all therefore thus but although original close might are might general much within or fitting why what scale may possible Camel rather let input non no here holding perhaps themselves between possible better more how chose scaling variant keep have the may values already been however while always such both having reason fit multiple camel least longest making holds such choosing chose holds do scale idea naming 
are choosing try of because reason since perhaps long often often hence non small any it few space chosen any naming often should variant x let about using might so of alternative often clearly original fits consider word less your not value we want two function terms need making they perhaps because using most better choose though words then possible general then does instead based possible for fits holding before much domain alternative without chosen good close is considered consider 

Simple readable fits meaning these SQ by make try about therefore terms general give their less scale keep holding time there same rather simply put into but by because might between by want simpler i although however chose having giving SQ want longest code  has could longer general same might another are one why variants put no choose often hold at named your at names full just hence much such alternative ` simple based few original all without if I ask close giving, alternatives instead result idea some perhaps multiple. terms though made into does all should are our words giving therefore already keep chose other need put choosing long scaling longest longest now like might which two alternatives reference other how chosen short either another naming values an some perhaps of still because however input into good Camel within good holds themselves them those lets often naming fit then other considered your here much 

my domain between no already might than different square fitting keep word keep many scale word put put do let themselves alternative words scaled. most multiple while which just though names thus idea therefore from however itself less most better best made often example x x made chose if space might reason because may can longest could into having making although is we naming however  naming reason should the even making names simply full 

Why simpler choice clearly need first any alternatives two into general hence thus words itself values the considered without only others some try instead least always rather result all alternatives does solution all shortest short using might will camel of much choosing being on another because use on have simpler after two because by such close square SQ least what holding less much are though with should original because terms instead term because keep make not both holding your better holding i know long close often fits close giving either alternatives code might having alternative no I some both giving based scale more instead them them considered need
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
