#' Marboha_palettes palette
#'
Marboha_palettes <- list(
  Marboha = c("#9b151c", "#d1b07b", "#08457c", "#c67281", "#4f8db2", "#3c2431", "#6d6862")
)


#' Marboha palette generator
#'
#' @param n Number of colors desired.
#'
#' @return A vector of colors.
#' @export
#'
#' @examples
#' Marboha(3)

Marboha <- function(n) {

  pal <- Marboha_palettes[["Marboha"]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of requested colors greater than what this palette can offer")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = "Marboha")
}


#' print.palette
#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @param x X
#' @param ... Not sure
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}

