using Literate: Literate
using TensorProducts: TensorProducts

function ccq_logo(content)
  include_ccq_logo = """
    ```@raw html
    <img src="assets/CCQ.png" width="20%" alt="Flatiron Center for Computational Quantum Physics logo.">
    ```
    """
  content = replace(content, "{CCQ_LOGO}" => include_ccq_logo)
  return content
end

Literate.markdown(
  joinpath(pkgdir(TensorProducts), "examples", "README.jl"),
  joinpath(pkgdir(TensorProducts), "docs", "src");
  flavor=Literate.DocumenterFlavor(),
  name="index",
  postprocess=ccq_logo,
)
