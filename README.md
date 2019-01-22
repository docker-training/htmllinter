# HTML Linter

## Usage

Pull the `htmllinter` image from Docker Hub:

  ```bash
  docker image pull training/htmllinter:1.0
  ```

In the directory that contains the HTML code you want to check, run:

  ```bash
  docker container run -v $(PWD):/code training/htmllinter:1.0
  ```
  
## Checks for:

 - Broken URLs in HTML files


