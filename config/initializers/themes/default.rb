# Theme configuration file
# ========================
# This file is used for all theme configuration.
# It's where you define everything that's editable in Spina CMS.

Spina::Theme.register do |theme|
  # All views are namespaced based on the theme's name
  theme.name = "default"
  theme.title = "Default theme"

  # Parts
  # Define all editable parts you want to use in your view templates
  #
  # Built-in part types:
  # - Line
  # - MultiLine
  # - Text (Rich text editor)
  # - Image
  # - ImageCollection
  # - Attachment
  # - Option
  # - Repeater
  theme.parts = [
    {name: "text", title: "Body", hint: "Your main content", part_type: "Spina::Parts::Text"},
    {name: "body", title: "Body", hint: "Your main content", part_type: "Spina::Parts::Text"},
    {name: "title", title: "Title", part_type: "Spina::Parts::Line"},
    {name: "slug", title: "Slug", part_type: "Spina::Parts::Line"},
    {name: "summary", title: "Summary", hint: "A summary for your page", part_type: "Spina::Parts::Line"},
    {name: "image", title: "Image", hint: "An image for your stuff", part_type: "Spina::Parts::Image"},
    {name: "link", title: "Link", hint: "A URL", part_type: "Spina::Parts::Line"},
    {name: "linktext", title: "Link Text", hint: "The text for a link", part_type: "Spina::Parts::Line"},
    {name: "vimeo", title: "Vimeo ID", hint: "The text for a link", part_type: "Spina::Parts::Line"},
    {name: "problem", title: "Problem", part_type: "Spina::Parts::Repeater", parts: %w[title text image link linktext]},
    {name: "empathy", title: "Empathy", part_type: "Spina::Parts::Repeater", parts: %w[title text image link linktext]},
    {name: "features", title: "Features", part_type: "Spina::Parts::Repeater", parts: %w[title text image link linktext]},
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    {name: "homepage", title: "Homepage", parts: %w[text image link linktext features]},
    {name: "show", title: "Page", parts: %w[summary text image link linktext]},
    {name: "sales", title: "Sales Page", parts: %w[summary text image link linktext problem empathy]},
    {name: "course", title: "Course Page", parts: %w[slug summary body]},
    {name: "lesson", title: "Lesson Page", parts: %w[slug vimeo summary body]},
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    {name: "homepage", title: "Homepage", deletable: false, view_template: "homepage"}
  ]

  # Navigations (optional)
  # If your project has multiple navigations, it can be useful to configure multiple
  # navigations.
  theme.navigations = [
    {name: "main", label: "Main navigation"}
  ]

  # Layout parts (optional)
  # You can create global content that doesn't belong to one specific page. We call these layout parts.
  # You only have to reference the name of the parts you want to have here.
  theme.layout_parts = []

  # Resources (optional)
  # Think of resources as a collection of pages. They are managed separately in Spina
  # allowing you to separate these pages from the 'main' collection of pages.
  theme.resources = []

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = %w(button youtube vimeo gist)
end
