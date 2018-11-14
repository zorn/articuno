# Design Goals

Articuno should be able to generate a website with the following behaviors and properties:

* A blog-like collection of posts, organized by publish date.
* A collection of individual pages for things like an About page.
* All page content will be written in Markdown format.
* All pages will require a title.
* Page content should be able to include code samples that are syntax highlighted.
* Page content should be able to present a gallery of images (as the sole content or as part of written content).
    * Examples: Screenshot gallery, click to see full size.
    * Honor touches for mobile devices to interact with images.
    * Create thumbs with mechine learing to crop the more interesting parts.

## URI Design

Sample URIs:

* <https://blog.example.com/posts/2018/02/01/custom-page-slug> - titled, slugged content
* <https://blog.example.com/about> - normal page
* <https://blog.example.com/contact> - normal page