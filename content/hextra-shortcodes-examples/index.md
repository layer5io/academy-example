---
title: Hextra Shortcodes Examples
weight: 6
description: Demonstrations of every Hextra shortcode ported to the Academy theme. Each shortcode is namespaced under hextra/ to avoid conflicts with existing Academy, Docsy, and Hugo shortcodes.
draft: true
---

This page exercises every shortcode ported from the [Hextra](https://imfing.github.io/hextra/docs/guide/shortcodes/) Hugo theme. All shortcodes are invoked with the `hextra/` prefix.

{{< alert type="note" title="Test Page: Not for Production" >}}
This page will not be published in the production version of the site. It is only visible during local preview and serves as a rendering test for the Hextra shortcodes.
{{< /alert >}}

---

## Callout

Callouts highlight important information. Five types are supported: **default**, **info**, **warning**, **error**, and **important**.

{{< hextra/callout >}}
This is a **default** callout. It uses a light-bulb icon and green styling.
{{< /hextra/callout >}}

{{< hextra/callout type="info" >}}
This is an **info** callout. Use it to surface supplementary context.
{{< /hextra/callout >}}

{{< hextra/callout type="warning" >}}
This is a **warning** callout. Draw attention to potential issues.
{{< /hextra/callout >}}

{{< hextra/callout type="error" >}}
This is an **error** callout. Indicate something that went wrong.
{{< /hextra/callout >}}

{{< hextra/callout type="important" >}}
This is an **important** callout. Emphasize critical information.
{{< /hextra/callout >}}

### Callout with emoji

{{< hextra/callout emoji="🚀" >}}
You can use an **emoji** instead of an icon.
{{< /hextra/callout >}}

---

## Cards

Cards display content in a responsive grid. Wrap individual `hextra/card` shortcodes inside a `hextra/cards` container.

### Basic cards (3 columns, default)

{{< hextra/cards >}}
  {{< hextra/card link="https://gohugo.io" title="Hugo" subtitle="The world's fastest static site generator." icon="document-text" >}}
  {{< hextra/card link="https://getbootstrap.com" title="Bootstrap" subtitle="Build fast, responsive sites with Bootstrap." icon="folder" >}}
  {{< hextra/card link="https://github.com" title="GitHub" subtitle="Where the world builds software." icon="information-circle" >}}
{{< /hextra/cards >}}

### Two-column cards

{{< hextra/cards cols="2" >}}
  {{< hextra/card title="Card without link" subtitle="This card has no link — it is not clickable." >}}
  {{< hextra/card link="/" title="Card with tag" subtitle="This card sports a badge tag." tag="New" tagColor="success" >}}
{{< /hextra/cards >}}

---

## Details

A collapsible content block built on the native `<details>` element.

{{< hextra/details title="Click to expand this section" >}}
Here is the hidden content revealed when the summary is clicked.

- Supports **Markdown** formatting
- Lists, `code`, and _emphasis_ all work
{{< /hextra/details >}}

### Initially closed

{{< hextra/details title="This one starts closed" closed="true" >}}
You had to click to see this content!
{{< /hextra/details >}}

---

## Steps

Numbered step lists rendered with CSS counters. Use heading levels (h3–h6) inside the shortcode body.

{{< hextra/steps >}}

### Clone the repository

```bash
git clone https://github.com/layer5io/academy-example.git
```

### Install dependencies

```bash
npm install
```

### Start the development server

```bash
hugo server -D
```

{{< /hextra/steps >}}

---

## Tabs

Tabbed interfaces powered by Bootstrap 5 nav-tabs. Each `hextra/tab` is nested inside a `hextra/tabs` container.

{{< hextra/tabs >}}
  {{< hextra/tab name="Go" >}}
  ```go
  package main

  import "fmt"

  func main() {
      fmt.Println("Hello, World!")
  }
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="Python" >}}
  ```python
  print("Hello, World!")
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="JavaScript" >}}
  ```javascript
  console.log("Hello, World!");
  ```
  {{< /hextra/tab >}}
{{< /hextra/tabs >}}

### Pre-selected tab

The `selected` parameter sets the default tab.

{{< hextra/tabs >}}
  {{< hextra/tab name="macOS" >}}
  ```bash
  brew install hugo
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="Linux" selected=true >}}
  ```bash
  sudo apt install hugo
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="Windows" >}}
  ```powershell
  choco install hugo-extended
  ```
  {{< /hextra/tab >}}
{{< /hextra/tabs >}}

---

## File Tree

An interactive file tree with expandable folders. Compose `hextra/filetree/container`, `hextra/filetree/folder`, and `hextra/filetree/file`.

{{< hextra/filetree/container >}}
  {{< hextra/filetree/folder name="content" >}}
    {{< hextra/filetree/folder name="docs" >}}
      {{< hextra/filetree/file name="_index.md" >}}
      {{< hextra/filetree/file name="getting-started.md" >}}
    {{< /hextra/filetree/folder >}}
    {{< hextra/filetree/folder name="blog" state="closed" >}}
      {{< hextra/filetree/file name="_index.md" >}}
      {{< hextra/filetree/file name="first-post.md" >}}
    {{< /hextra/filetree/folder >}}
  {{< /hextra/filetree/folder >}}
  {{< hextra/filetree/folder name="layouts" >}}
    {{< hextra/filetree/file name="baseof.html" >}}
    {{< hextra/filetree/file name="index.html" >}}
  {{< /hextra/filetree/folder >}}
  {{< hextra/filetree/file name="hugo.yaml" >}}
  {{< hextra/filetree/file name="package.json" >}}
{{< /hextra/filetree/container >}}

---

## Badge

Inline badges with color variants.

### Positional form (gray, default)

{{< hextra/badge "Default" >}}

### Named parameters with colors

{{< hextra/badge content="Success" color="green" >}}
{{< hextra/badge content="Info" color="blue" >}}
{{< hextra/badge content="Warning" color="yellow" >}}
{{< hextra/badge content="Error" color="red" >}}
{{< hextra/badge content="Important" color="purple" >}}
{{< hextra/badge content="Amber" color="amber" >}}

### Badge with link

{{< hextra/badge content="Visit Hugo" color="blue" link="https://gohugo.io" >}}

### Badge with icon

{{< hextra/badge content="Documentation" color="green" icon="document-text" >}}

---

## Icon

Renders an inline SVG icon from `data/hextra/icons.yaml`.

Here are a few icons inline: {{< hextra/icon "light-bulb" >}} light-bulb, {{< hextra/icon "information-circle" >}} information-circle, {{< hextra/icon "exclamation" >}} exclamation, {{< hextra/icon "folder" >}} folder, {{< hextra/icon "document-text" >}} document-text.

---

## PDF

Embeds a PDF file in an iframe. _(Requires a real PDF path.)_

Usage:

```text
{{</* hextra/pdf "/path/to/sample.pdf" */>}}
```

<p class="text-body-secondary"><em>Supply a valid PDF path in the shortcode above to test rendering.</em></p>

---

## Include

Includes the rendered content of another page inline. _(Requires a page path that exists in the content directory.)_

Usage:

```text
{{%/* hextra/include "content-formatting-examples" */%}}
```

<p class="text-body-secondary"><em>Replace the path with an existing content page to test the <code>hextra/include</code> shortcode.</em></p>

---

## Term

Wraps a glossary term in an `<abbr>` tooltip. Definitions are sourced from `data/<lang>/termbase.yaml`.

Usage:

```text
{{</* hextra/term "API" */>}}
```

To test, create `data/en/termbase.yaml`:

```yaml
- abbr: API
  term: Application Programming Interface
  definition: A set of protocols for building software.
```

<p class="text-body-secondary"><em>Create the termbase data file above, then use the shortcode in your content.</em></p>

---

## Jupyter

Renders a Jupyter Notebook (.ipynb) as code blocks and markdown cells.

Usage:

```text
{{%/* hextra/jupyter "notebook.ipynb" */%}}
```

<p class="text-body-secondary"><em>Place a <code>.ipynb</code> file in this page bundle and use the shortcode above to test.</em></p>

---

## Asciinema

Embeds an asciinema terminal recording player.

Usage:

```text
{{</* hextra/asciinema file="demo.cast" */>}}
```

<p class="text-body-secondary"><em>Place a <code>.cast</code> file in this page bundle and use the shortcode above to test.</em></p>

---

## Combined example

Below is a realistic example combining several shortcodes:

{{< hextra/callout type="info" >}}
Follow the steps below to set up your development environment.
{{< /hextra/callout >}}

{{< hextra/steps >}}

### Prerequisites

Make sure you have the following installed:

{{< hextra/cards cols="2" >}}
  {{< hextra/card title="Hugo Extended" subtitle="v0.146.0 or later" link="https://gohugo.io/installation/" icon="document-text" >}}
  {{< hextra/card title="Node.js" subtitle="LTS version recommended" link="https://nodejs.org/" icon="folder" >}}
{{< /hextra/cards >}}

### Clone and install

{{< hextra/tabs >}}
  {{< hextra/tab name="HTTPS" >}}
  ```bash
  git clone https://github.com/layer5io/academy-example.git
  cd academy-example && npm install
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="SSH" >}}
  ```bash
  git clone git@github.com:layer5io/academy-example.git
  cd academy-example && npm install
  ```
  {{< /hextra/tab >}}
{{< /hextra/tabs >}}

### Verify the project structure

{{< hextra/filetree/container >}}
  {{< hextra/filetree/folder name="academy-example" >}}
    {{< hextra/filetree/folder name="content" >}}
      {{< hextra/filetree/file name="_index.md" >}}
    {{< /hextra/filetree/folder >}}
    {{< hextra/filetree/file name="hugo.yaml" >}}
    {{< hextra/filetree/file name="package.json" >}}
    {{< hextra/filetree/file name="go.mod" >}}
  {{< /hextra/filetree/folder >}}
{{< /hextra/filetree/container >}}

### Start the server

```bash
hugo server -D
```

{{< hextra/callout type="warning" >}}
The `-D` flag renders draft pages. Remove it for production builds.
{{< /hextra/callout >}}

{{< /hextra/steps >}}

{{< hextra/badge content="Setup complete" color="green" icon="light-bulb" >}}
