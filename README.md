<p align="center">
  <img src=".github/readme/images/layer5-light-no-trim.svg" width="40%" alt="Layer5 Logo">
</p>

<p align="center">
  <a href="https://layer5.io/learn/academy"><img src="https://img.shields.io/badge/Layer5-Academy-00B39F?style=for-the-badge" alt="Layer5 Academy"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/layer5io/academy-example?style=for-the-badge" alt="Apache 2.0 License"></a>
  <a href="https://gohugo.io/"><img src="https://img.shields.io/badge/Hugo-Framework-FF4088?logo=hugo&logoColor=white&style=for-the-badge" alt="Hugo"></a>
</p>

<h1 align="left">
  <img
    src=".github/readme/images/academy-layer5-light.png"
    width="50"
    alt="Academy"
    align="left"
  />
 Layer5 Academy - Content Starter Template
</h1>

This repository offers a starter template for creating your own, dedicated academy on the [Layer5 Academy](https://cloud.layer5.io/academy/overview) platform. This repository provides the necessary file structure and a working example to help you get started quickly. The guide below offers a quick start to setting up your own content repository, creating curricula, and previewing your academy locally.

---

> For in-depth tutorials and customization examples, see the [Layer5 Academy docs](https://docs.layer5.io/cloud/academy/).

---

## Prerequisites

Before you begin, ensure you have the following installed on your system:

  1. [**Go**](https://go.dev/doc/install) (use the version required by the root `go.mod` file)
  2. [**Node.js / npm**](https://nodejs.org/) (LTS recommended)

> Hugo Extended is installed locally by `make setup` and does not need to be installed globally.

## Getting Started

Follow these steps to create your own learning path using this template.

### 1. Fork & Clone the Repository

First, create a copy of this repository under your own GitHub account.

  - **Fork** this [academy-example](https://github.com/layer5io/academy-example) repository.
  - Clone your forked repository:
    ```bash
    # Replace <your-username> with your GitHub username
    git clone https://github.com/<your-username>/academy-example.git
    cd academy-example
    ```

### 2. Update the Go Module Path

  - Open the `go.mod` file at the root of the project.
  - Change the first line from:
    ```go
    module github.com/layer5io/academy-example
    ```
  - To match your repository's path:
    ```go
    module github.com/<your-username>/academy-example
    ```
  - Save the file, then commit and push the change.

### 3. Configure Your Organization Directories

The Academy platform uses an **Organization UID** to keep content separate and secure. You must get this ID from the Layer5 Cloud before proceeding.

Once you have your UID, rename the placeholder directories:

  - Rename `content/learning-paths/your-org-uid` to `content/learning-paths/<your-organization-uid>`
  - Rename `static/your-org-uuid` to `static/<your-organization-uid>`
  - Rename `layouts/shortcodes/your-org-uuid` to `layouts/shortcodes/<your-organization-uid>`

### 4. Add Your Content

Now you're ready to create your learning path. The structure is: **Learning Path → Course → Chapter → Lesson**.

A high-level view of the structure looks like this:
  ```text
  content/
  └── learning-paths/
      ├── _index.md
      └── <your-organization-uid>/
          └── <your-learning-path>/
              ├── _index.md
              └── <your-course-1>/
              └── <your-course-2>/
                  ├── _index.md
                  └── content/
                      └── your-lesson-1.md
                      └── your-lesson-2.md
  ```

  - **Delete the example content** inside `content/learning-paths/<your-organization-uid>/`.
  - **Create your folder structure** following the example's hierarchy.
  - **Add your lessons** as Markdown (`.md`) files inside the `content` directory of a course.
  - **Use frontmatter** at the top of your `_index.md` and lesson files to define titles, descriptions, and weights.

### Add Assessments

Assessment files use the Academy test layout and define their questions in Markdown frontmatter. Use short, stable IDs for questions and options; question IDs must be unique within one assessment, and option IDs must be unique within one question. The Academy theme converts these author-facing IDs into deterministic UUIDs in the generated JSON consumed by Layer5 Cloud.

```yaml
---
title: "Assessment Example"
id: "assessment-example"
type: "test"
layout: "test"
passPercentage: 70
maxAttempts: 3
timeLimit: 30
numberOfQuestions: 1
questions:
  - id: "q1"
    text: "Academy content is authored in Markdown."
    type: "true-false"
    marks: 1
    options:
      - id: "true"
        text: "True"
        isCorrect: true
      - id: "false"
        text: "False"
---
```

### 5. Add Assets (Images & Videos)

Enhance your course with images and other visual aids using the **Page Bundling** method, which keeps assets alongside the content that references them and ensures they resolve correctly for each organization.

**How to Add an Image**

1.  Place your image file directly in the same directory as your Markdown content:

```text
    content/learning-paths/<your-organization-uid>/
    └── <your-course>/
        └── <your-module>/
            ├── _index.md
            └── hugo-logo.png
```

2.  In your `lesson-1.md` file, reference the image using standard Markdown syntax:

```markdown
    ![The Hugo Logo](hugo-logo.png)
```

> **Note:** The `usestatic` shortcode is **deprecated** and should not be used in new content. Use the Page Bundling method above.

**How to Add a Video**

```text
{{</* card
title="Video: Example" */>}}
<video width="100%" height="100%" controls>
    <source src="https://example.com/your-video.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>
{{</* /card */>}}
```

### 6. Local Development

This project includes a `Makefile` with helper targets to simplify local development and maintenance. Use the commands below as a quick reference.

```bash
# Install necessary tools and modules
make setup

# Start the local Hugo development server with live reload
make site

# Serve the site once with the file watcher off (no live reload)
make serve

# Build the site locally with draft and future content enabled
make build

# Build the site for a deploy preview (honors DEPLOY_PRIME_URL)
make build-preview

# Build the site for production (pass BASE_URL=... to set the base URL)
make build-production

# Empty the build cache, reinstall dependencies, and run the site locally
make clean

# Check Markdown for linting issues
make lint

# Fix Markdown linting issues
make lint-fix

# Check internal links in the built site
make check-links

# Verify Go is installed before starting the local site
make check-go

# Update the academy-theme package version
make theme-update
```

Run `make site` to view your content and check for formatting issues before publishing.

> The local preview uses basic styling. Full Academy branding and styles will be applied after your content is integrated into the cloud platform.

### 7. Going Live

Once your content is complete and tested locally:

1.  Push all your changes to your forked repository on GitHub.
2.  **[Connect](https://layer5.io/company/contact) the Layer5 Team** via Slack, email, or by opening a GitHub issue.
3.  Provide the URL to your content repository.

A Layer5 administrator will then integrate your repository into the main Academy platform. After integration, your learning paths will be visible on the official [Layer5 Cloud site](https://cloud.layer5.io/academy/overview).


## Community & Contributions

We warmly welcome contributions of all kinds! Whether you're improving documentation, enhancing the example academy, fixing bugs, or proposing new features, your contributions help make the Academy ecosystem better for everyone.

Before getting started, please review this project's [contributing guidelines][contrib].

Contributors are expected to follow the [CNCF Code of Conduct](https://github.com/cncf/foundation/blob/master/code-of-conduct.md).

### Helpful Resources

* 📚 Academy [documentation][docs], [example][example], and [theme][theme]
* 🎨 Layer5 [designs and wireframes][figma] in Figma ([open invite][figma-invite])
* 👥 Connect through the [Layer5 Discussion Forum][forum] and [Layer5 Community Slack][slack]

<p>
<a href="https://slack.layer5.io">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset=".github/readme/images/slack-dark-128.png">
  <source media="(prefers-color-scheme: light)" srcset=".github/readme/images/slack-128.png">
  <img src=".github/readme/images/slack-128.png"
       width="120"
       align="right"
       alt="Join Layer5 Slack">
</picture>

</a>

<a href="https://layer5.io/community">
  <img src=".github/readme/images/community.svg"
       width="140"
       align="left"
       style="margin-right:10px;"
       alt="Layer5 Community">
</a>

✔️ <strong>Join</strong> the Layer5 Slack Community.<br />
✔️ <strong>Discuss</strong> in the Community Forum.<br />
✔️ <strong>Explore</strong> the Community Handbook.<br />
✔️ <strong>Start</strong> with the Newcomer's Guide.<br />

</p>

<br clear="both" />

[contrib]: ./CONTRIBUTING.md
[docs]: https://docs.layer5.io/cloud/academy/
[example]: https://github.com/layer5io/academy-example/
[theme]: https://github.com/layer5io/academy-theme/
[figma]: https://www.figma.com/file/5ZwEkSJwUPitURD59YHMEN/Layer5-Designs
[figma-invite]: https://www.figma.com/team_invite/redeem/GvB8SudhEOoq3JOvoLaoMs
[forum]: https://discuss.layer5.io
[slack]: https://slack.layer5.io