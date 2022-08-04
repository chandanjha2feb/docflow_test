CREATE TABLE `comments` (
  `id` varchar(255),
  `message` text,
  `user_id` integer,
  `section_id` integer,
  `parent_comment_id` integer,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `contents` (
  `id` varchar(255),
  `section_id` integer,
  `content_type` string,
  `html_part` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `members` (
  `id` varchar(255),
  `user_id` integer,
  `organization_id` integer,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `organizations` (
  `id` varchar(255),
  `user_id` integer,
  `owner_id_id` integer,
  `name` string,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `plans` (
  `id` varchar(255),
  `plan_type` string,
  `subscription_id` integer,
  `created_at` datetime,
  `updated_at` datetime,
  `plan_frequency` string
);

CREATE TABLE `sections` (
  `id` varchar(255),
  `template_id` integer,
  `parent_section_id` integer,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `subscriptions` (
  `id` varchar(255),
  `status` integer,
  `start_date` date,
  `expires_on` date,
  `user_id` integer,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `templates` (
  `id` varchar(255),
  `user_id` integer,
  `name` string,
  `description` string,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `users` (
  `id` varchar(255),
  `email` string,
  `password` string,
  `created_at` datetime,
  `updated_at` datetime
);

ALTER TABLE `comments` ADD CONSTRAINT `fk_rails_comments_comments` FOREIGN KEY (`id`) REFERENCES `comments` (`parent_comment_id`);

ALTER TABLE `sections` ADD CONSTRAINT `fk_rails_comments_sections` FOREIGN KEY (`id`) REFERENCES `comments` (`section_id`);

ALTER TABLE `users` ADD CONSTRAINT `fk_rails_comments_users` FOREIGN KEY (`id`) REFERENCES `comments` (`user_id`);

ALTER TABLE `sections` ADD CONSTRAINT `fk_rails_contents_sections` FOREIGN KEY (`id`) REFERENCES `contents` (`section_id`);

ALTER TABLE `organizations` ADD CONSTRAINT `fk_rails_members_organizations` FOREIGN KEY (`id`) REFERENCES `members` (`organization_id`);

ALTER TABLE `users` ADD CONSTRAINT `fk_rails_members_users` FOREIGN KEY (`id`) REFERENCES `members` (`user_id`);

ALTER TABLE `sections` ADD CONSTRAINT `fk_rails_sections_sections` FOREIGN KEY (`id`) REFERENCES `sections` (`parent_section_id`);

ALTER TABLE `templates` ADD CONSTRAINT `fk_rails_sections_templates` FOREIGN KEY (`id`) REFERENCES `sections` (`template_id`);

ALTER TABLE `users` ADD CONSTRAINT `fk_rails_templates_users` FOREIGN KEY (`id`) REFERENCES `templates` (`user_id`);

ALTER TABLE `users` ADD CONSTRAINT `fk_rails_organizations_users` FOREIGN KEY (`id`) REFERENCES `organizations` (`user_id`);

ALTER TABLE `subscriptions` ADD CONSTRAINT `fk_rails_plans_subscriptions` FOREIGN KEY (`id`) REFERENCES `plans` (`subscription_id`);

ALTER TABLE `users` ADD CONSTRAINT `fk_rails_subscriptions_users` FOREIGN KEY (`id`) REFERENCES `subscriptions` (`user_id`);
