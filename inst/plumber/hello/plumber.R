#* Personal greeting as a Plumber API
#* @param name Your name (character string; e.g. "john doe").
#* @get /echo
plumber_api <- function(name = "your name") {
    r.pkg.template::hello(name)
}
