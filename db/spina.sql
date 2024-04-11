INSERT INTO spina_accounts (name, address, postal_code, city, phone, email, preferences, created_at, updated_at, robots_allowed, json_attributes) VALUES
('Railz', NULL, NULL, NULL, NULL, NULL, '---
theme: default
', '2024-04-01 16:24:43.537309', '2024-04-01 16:24:45.376544', 'f', '{en_content: []}');

INSERT INTO spina_navigations (name, label, auto_add_pages, position, created_at, updated_at) VALUES
('main', 'Main navigation', 'f', 0, '2024-04-01 16:24:45.397314', '2024-04-01 16:24:45.397314');


INSERT INTO spina_pages (show_in_menu, slug, deletable, created_at, updated_at, name, skip_to_first_child, view_template, layout_template, draft, link_url, ancestry, position, active, resource_id, json_attributes, ancestry_depth, ancestry_children_count) VALUES
(341, 't', NULL, 'f', '2024-04-01 16:24:45.472099', '2024-04-01 16:27:04.208097', 'homepage', 'f', 'homepage', NULL, 'f', NULL, NULL, 1, 't', NULL, '{en_content: [{name: text, type: Spina::Parts::Text, content: <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</div>}, {alt: , name: image, type: Spina::Parts::Image, filename: astronaut.jpg, image_id: 4, signed_blob_id: eyJfcmFpbHMiOnsiZGF0YSI6MTMsInB1ciI6ImJsb2JfaWQifX0=--4fa961c0e7d8db334991ccde75848bb8d8bbcbba}, {name: link, type: Spina::Parts::Line, content: #}, {name: linktext, type: Spina::Parts::Line, content: Get Your Kicks}, {name: features, type: Spina::Parts::Repeater, content: []}]}', 0, NULL);


INSERT INTO spina_page_translations (id, spina_page_id, locale, title, menu_title, description, seo_title, materialized_path, created_at, updated_at, url_title) VALUES
(341, 341, 'en', 'So, this is Rails, innit?', NULL, NULL, NULL, '/', '2024-04-01 16:24:45.475358', '2024-04-01 16:27:04.206653', NULL);