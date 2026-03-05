CREATE TABLE IF NOT EXISTS `app` (
	`app_id` INTEGER NOT NULL UNIQUE,
	`app_name` VARCHAR(255) NOT NULL UNIQUE,
	`reviews` INTEGER NOT NULL,
	`size` VARCHAR(255) NOT NULL,
	`installs` VARCHAR(255) NOT NULL,
	`price` FLOAT NOT NULL,
	`content` VARCHAR(255) NOT NULL,
	`last updated` DATETIME NOT NULL,
	`android_version` VARCHAR(255) NOT NULL,
	`rating` FLOAT NOT NULL,
	`current_version` VARCHAR(255) NOT NULL,
	`category_id` INTEGER NOT NULL,
	`type_id` INTEGER NOT NULL,
	PRIMARY KEY(`app_id`)
);


CREATE INDEX `APPS_index_0`
ON `app` (`category_id`);
CREATE TABLE IF NOT EXISTS `types` (
	`type_id` INTEGER NOT NULL UNIQUE,
	`type_name` DATETIME NOT NULL UNIQUE,
	`app_id` INTEGER NOT NULL,
	PRIMARY KEY(`type_id`)
);


CREATE TABLE IF NOT EXISTS `genres` (
	`genres_id` INTEGER NOT NULL UNIQUE,
	`genre_name` VARCHAR(255) NOT NULL,
	`category_id` INTEGER NOT NULL,
	PRIMARY KEY(`genres_id`)
);


CREATE INDEX `genres_index_0`
ON `genres` (`category_id`);
CREATE TABLE IF NOT EXISTS `content_ratings` (
	`rating_id` INTEGER NOT NULL,
	`rating_name` VARCHAR(255) NOT NULL UNIQUE,
	`app_id` INTEGER NOT NULL UNIQUE,
	PRIMARY KEY(`rating_id`)
);


CREATE TABLE IF NOT EXISTS `categories` (
	`category_id` INTEGER NOT NULL UNIQUE,
	`category_name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`category_id`)
);


ALTER TABLE `types`
ADD FOREIGN KEY(`app_id`) REFERENCES `app`(`app_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `content_ratings`
ADD FOREIGN KEY(`app_id`) REFERENCES `app`(`app_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `app`
ADD FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `genres`
ADD FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
ON UPDATE CASCADE ON DELETE CASCADE;