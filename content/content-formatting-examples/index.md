---
title: Content Formatting Examples
weight: 5
description: A collection of examples for formatting content, from basic Markdown text to advanced custom components and shortcodes.
draft: true
---

The Layer5 Academy platform supports a wide range of shortcodes for enriching your learning content. Shortcodes are reusable template snippets you invoke in Markdown files to generate HTML output. They come from four sources:

1. **Academy Theme** — custom shortcodes built specifically for the Academy platform.
2. **Hextra** — shortcodes ported from the [Hextra](https://imfing.github.io/hextra/docs/guide/shortcodes/) Hugo theme, namespaced under `hextra/` to avoid conflicts.
3. **Docsy Theme** — shortcodes inherited from the [Google Docsy](https://www.docsy.dev/) documentation theme.
4. **Hugo Built-in** — shortcodes included with the [Hugo](https://gohugo.io/) static site generator.

For guidance on creating your own shortcodes, see [Extending the Academy](/cloud/academy/creating-content/extending-the-academy/).

{{< alert type="note" title="Example Page: Not for Production" >}}
This page will not be published in the [production version](https://cloud.layer5.io/academy/) of the site. It is only visible for local preview and serves as a reference. You can safely delete this page from your repository at any time.
{{< /alert >}}

## Image styling

By default, Markdown images are written like this:

```markdown
![Alt text](/path/to/image.png)
```

These are rendered with:
* `max-width: 70%` of the viewport
* `max-height: 80vh` of the viewport height
* centered block layout

This default styling works well for most landscape (horizontal) images. However, if an image is very tall, narrow, or otherwise looks awkward, you can override the default by embedding raw HTML and specifying a custom size:

```html
<img src="./images/example.png" alt="Example description" 
style="max-width: 40vw; max-height: 60vh; display: block; margin: 1rem auto;" />
```

## Using Hugo shortcodes

Shortcodes let you define reusable snippets and embed them in content.

Usage:

```code
  { {% shortcode-name %}}
```

The shortcode name is the file name (minus the `.html`) in `layouts/shortcodes/your-org-uuid`.

## Markdown

Text can be **bold**, _italic_, or ~~strikethrough~~. [Links](https://gohugo.io) have no underline (unless hovered).

> Blockquotes are lighter with a left border.

### Code

```
This is a code block.
```

Inline code like `var foo = "bar";` is supported.

### Lists

Unordered:

* Liverpool F.C.
* Chelsea F.C.
* Manchester United F.C.

Ordered:

1. Michael Brecker
2. Seamus Blake
3. Branford Marsalis

Task list:

* [x] Create a Hugo theme
* [x] Add task lists to it
* [ ] Take a vacation

### Tables

| Artist            | Album           | Year |
|-------------------|-----------------|------|
| Michael Jackson   | Thriller        | 1982 |
| Prince            | Purple Rain     | 1984 |
| Beastie Boys      | License to Ill  | 1986 |

Inline code inside table cells:

| Language    | Code               |
|-------------|--------------------|
| JavaScript  | `var foo = "bar";` |
| Ruby        | `foo = "bar"`      |

----------------

Small images should be shown at their actual size.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg/240px-Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg)

Large images should always scale down and fit in the content container.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg/1024px-Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg)

_The photo above of the Spruce Picea abies shoot with foliage buds: Bjørn Erik Pedersen, CC-BY-SA._

## Components

### Embedded design

```
{{</* meshery-design-embed
  id="embedded-design-c811e9f4-2522-4eb6-b775-7475545356d8"
  src="./embedded-design-deploy-meshery-using-meshery.js"
*/>}}
```

The rendered output is shown below:

<!-- Learn more at https://docs.layer5.io/kanvas/designer/export-designs/#exporting-as-embedding -->
{{< meshery-design-embed
  id="embedded-design-c811e9f4-2522-4eb6-b775-7475545356d8"
  src="./embedded-design-deploy-meshery-using-meshery.js"
>}}

> [Learn more](https://docs.layer5.io/kanvas/designer/embedding-designs/) about embedded designs.

### Alerts

{{< alert title="Note" >}}A plain alert with a title.{{< /alert >}}
{{< alert type="note" title="Note" >}}This alert supports a title and **Markdown**.{{< /alert >}}
{{< alert type="info" title="Info" >}}This is an informational alert.{{< /alert >}}
{{< alert type="danger" title="Danger" >}}This is a danger alert.{{< /alert >}}
{{< alert type="warning" title="Warning" >}}This is a warning alert.{{< /alert >}}

### TabPanel

{{< tabpane text=true >}}

{{% tab header="Example 1" lang="en" active="true" %}}

Tabs help organize related content.

- Concise explanation
- Another brief point

{{< /tab >}}

{{% tab header="Example 2" lang="en" %}}

Tabs help organize related content.

- Concise explanation
- Another brief point

{{< /tab >}}

{{% tab header="Example 3" lang="en" %}}

Here is an example image:

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg/1024px-Picea_abies_shoot_with_buds%2C_Sogndal%2C_Norway.jpg)

{{< /tab >}}

{{< /tabpane >}}

### Collapsible

{{< details summary="This is a collapsible title" >}}

This is the collapsed content.

It can be a list:
- First item
- Second item
{{< /details >}}

### Footnotes

This is a superscript number for your footnote. [^1]

[^1]: This is a footnote.

---

## Hextra Shortcodes

The shortcodes below are ported from the [Hextra Hugo theme](https://imfing.github.io/hextra/docs/guide/shortcodes/) and adapted to work with Bootstrap 5. They are all namespaced under `hextra/` to avoid conflicts with Academy, Docsy, and Hugo built-in shortcodes.

{{< hextra/callout type="info" >}}
All Hextra shortcodes use the **angle-bracket** syntax `{{</* */>}}` (not the percent syntax `{{%/* */%}}`). This ensures raw HTML output is preserved correctly.
{{< /hextra/callout >}}

### Callout

Callouts highlight important information with a colored left border and an icon. Five types are supported: **default** (green), **info** (blue), **warning** (orange), **error** (red), and **important** (teal).

```text
{{</* hextra/callout type="info" */>}}
Your message here. Supports **Markdown**.
{{</* /hextra/callout */>}}
```

**Parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `type` | Callout style: `default`, `info`, `warning`, `error`, `important` | `default` |
| `emoji` | Optional emoji to replace the icon (e.g., `"🚀"`) | _(none)_ |

**Examples:**

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

{{< hextra/callout emoji="🚀" >}}
You can use an **emoji** instead of the default icon.
{{< /hextra/callout >}}

---

### Cards

Cards display content in a responsive grid. Wrap individual `hextra/card` shortcodes inside a `hextra/cards` container.

```text
{{</* hextra/cards cols="3" */>}}
  {{</* hextra/card link="https://example.com" title="Title" subtitle="Description" icon="document-text" */>}}
  {{</* hextra/card title="No link" subtitle="This card is not clickable." */>}}
{{</* /hextra/cards */>}}
```

**Container parameters (`hextra/cards`):**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `cols` | Number of columns at the `lg` breakpoint | `3` |

**Card parameters (`hextra/card`):**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `title` | Card heading | _(required)_ |
| `subtitle` | Description text below the title | _(none)_ |
| `link` | URL the card links to. When omitted, the card is rendered as a `<div>` instead of a link. | _(none)_ |
| `icon` | Icon name from `data/hextra/icons.yaml` | _(none)_ |
| `image` | Image URL or page-bundle path | _(none)_ |
| `tag` | Badge text shown in the top-right corner | _(none)_ |
| `tagColor` | Bootstrap color name for the tag badge | `secondary` |

**Examples:**

{{< hextra/cards >}}
  {{< hextra/card link="https://gohugo.io" title="Hugo" subtitle="The world's fastest static site generator." icon="document-text" >}}
  {{< hextra/card link="https://getbootstrap.com" title="Bootstrap" subtitle="Build fast, responsive sites with Bootstrap." icon="folder" >}}
  {{< hextra/card link="https://github.com" title="GitHub" subtitle="Where the world builds software." icon="information-circle" >}}
{{< /hextra/cards >}}

{{< hextra/cards cols="2" >}}
  {{< hextra/card title="Card without link" subtitle="This card has no link — it is not clickable." >}}
  {{< hextra/card link="/" title="Card with tag" subtitle="This card sports a badge tag." tag="New" tagColor="success" >}}
{{< /hextra/cards >}}

---

### Details

A collapsible content block built on the native HTML `<details>` element with card styling and a rotating chevron indicator.

```text
{{</* hextra/details title="Click to expand" */>}}
Hidden content here. Supports **Markdown**.
{{</* /hextra/details */>}}
```

**Parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `title` | Summary text (supports Markdown) | _(empty)_ |
| `closed` | Set to `"true"` to render collapsed | open |

**Examples:**

{{< hextra/details title="Click to expand this section" >}}
Here is the hidden content revealed when the summary is clicked.

- Supports **Markdown** formatting
- Lists, `code`, and _emphasis_ all work
{{< /hextra/details >}}

{{< hextra/details title="This one starts closed" closed="true" >}}
You had to click to see this content!
{{< /hextra/details >}}

---

### Steps

Numbered step lists rendered with CSS counters. Place `h3`&ndash;`h6` headings inside the shortcode body &mdash; each heading becomes a numbered step.

```text
{{</* hextra/steps */>}}

### First step
Description of the first step.

### Second step
Description of the second step.

{{</* /hextra/steps */>}}
```

**Example:**

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

### Tabs

Tabbed interfaces powered by Bootstrap 5 nav-tabs. Each `hextra/tab` is nested inside a `hextra/tabs` container. Tabs support cross-page sync via localStorage when tabs share the same names.

```text
{{</* hextra/tabs */>}}
  {{</* hextra/tab name="Tab One" */>}}Content for tab one.{{</* /hextra/tab */>}}
  {{</* hextra/tab name="Tab Two" */>}}Content for tab two.{{</* /hextra/tab */>}}
{{</* /hextra/tabs */>}}
```

**Tab parameters (`hextra/tab`):**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `name` | Tab label | `Tab <N>` |
| `selected` | Set to `"true"` to pre-select this tab | `false` |

**Examples:**

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

Pre-selected tab using `selected="true"`:

{{< hextra/tabs >}}
  {{< hextra/tab name="macOS" >}}
  ```bash
  brew install hugo
  ```
  {{< /hextra/tab >}}
  {{< hextra/tab name="Linux" selected="true" >}}
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

### File Tree

An interactive file tree with expandable/collapsible folders. Compose three shortcodes: `hextra/filetree/container`, `hextra/filetree/folder`, and `hextra/filetree/file`.

```text
{{</* hextra/filetree/container */>}}
  {{</* hextra/filetree/folder name="src" */>}}
    {{</* hextra/filetree/file name="main.go" */>}}
  {{</* /hextra/filetree/folder */>}}
  {{</* hextra/filetree/file name="README.md" */>}}
{{</* /hextra/filetree/container */>}}
```

**Folder parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `name` | Folder name | _(required)_ |
| `state` | `"open"` or `"closed"` | `open` |

**File parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `name` | File name | _(required)_ |

**Example:**

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

### Badge

Inline badges with color variants. Supports both positional and named parameter forms.

```text
{{</* hextra/badge "Simple badge" */>}}
{{</* hextra/badge content="Styled" color="green" link="https://example.com" icon="document-text" */>}}
```

**Parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `content` | Badge text (or use positional param) | _(required)_ |
| `color` | Color name: `gray`, `green`, `blue`, `yellow`, `red`, `purple`, `orange`, `indigo`, `amber` | `gray` |
| `link` | Optional URL to wrap the badge as a link | _(none)_ |
| `icon` | Optional icon name from `data/hextra/icons.yaml` | _(none)_ |

**Examples:**

{{< hextra/badge "Default" >}} {{< hextra/badge content="Success" color="green" >}} {{< hextra/badge content="Info" color="blue" >}} {{< hextra/badge content="Warning" color="yellow" >}} {{< hextra/badge content="Error" color="red" >}} {{< hextra/badge content="Important" color="purple" >}} {{< hextra/badge content="Amber" color="amber" >}}

With a link: {{< hextra/badge content="Visit Hugo" color="blue" link="https://gohugo.io" >}}

With an icon: {{< hextra/badge content="Documentation" color="green" icon="document-text" >}}

---

### Icon

Renders an inline SVG icon from `data/hextra/icons.yaml`. Useful for embedding icons in running text.

```text
{{</* hextra/icon "light-bulb" */>}}
```

**Available icons:** Here are a few icons inline: {{< hextra/icon "light-bulb" >}} `light-bulb`, {{< hextra/icon "information-circle" >}} `information-circle`, {{< hextra/icon "exclamation" >}} `exclamation`, {{< hextra/icon "folder" >}} `folder`, {{< hextra/icon "document-text" >}} `document-text`.

---

### PDF

Embeds a PDF file in a responsive iframe.

```text
{{</* hextra/pdf "/path/to/sample.pdf" */>}}
```

Supply a valid PDF path (page-bundle resource, asset, or absolute path) to render the embedded viewer.

---

### Include

Includes the rendered content of another page inline. The parameter is the page path (relative to the content directory, without the file extension).

```text
{{%/* hextra/include "page-path" */%}}
```

---

### Term

Wraps a glossary term in an `<abbr>` tooltip. Definitions are sourced from `data/<lang>/termbase.yaml` (e.g., `data/en/termbase.yaml`).

```text
{{</* hextra/term "API" */>}}
```

To use this shortcode, create a termbase data file. For example, `data/en/termbase.yaml`:

```yaml
- abbr: API
  term: Application Programming Interface
  definition: A set of protocols for building software.
```

---

### Jupyter

Renders a Jupyter Notebook (`.ipynb`) as code blocks and Markdown cells.

```text
{{%/* hextra/jupyter "notebook.ipynb" */%}}
```

**Parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| positional | Path or URL to the `.ipynb` file | _(required)_ |
| `allowUnsafeHTML` | Set to `"true"` to render raw HTML from notebook outputs | `false` |

Place a `.ipynb` file in the page bundle or `assets/` directory and reference it by name.

---

### Asciinema

Embeds an [asciinema](https://asciinema.org/) terminal recording player. The player CSS/JS is loaded from CDN automatically when this shortcode is used.

```text
{{</* hextra/asciinema file="demo.cast" */>}}
```

**Parameters:**

| Parameter | Description | Default |
|-----------|-------------|---------|
| `file` | Path or URL to the `.cast` file (also accepts positional param) | _(required)_ |
| `theme` | Player color theme | `asciinema` |
| `speed` | Playback speed multiplier | `1` |
| `autoplay` | Auto-play on load | `false` |
| `loop` | Loop playback | `false` |
| `poster` | Poster/thumbnail specification | _(none)_ |
| `markers` | Comma-separated time markers (e.g., `"5:Intro,10:Demo"`) | _(none)_ |

Place a `.cast` file in the page bundle and reference it by name.

---

## Hextra Shortcodes: Combined example

Below is a realistic example that combines several Hextra shortcodes to document a setup workflow:

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
