DROP TABLE IF EXISTS `custom_attributes`;
CREATE TABLE `custom_attributes` (
 `custom_attribute_id` mediumint(8) unsigned NOT NULL auto_increment,
 `display_label` varchar(50) NOT NULL,
 `display_type` tinyint(2) unsigned NOT NULL,
 `attribute_category` tinyint(2) unsigned NOT NULL,
 `validation_regex` varchar(50),
 `is_required` tinyint(1) unsigned NOT NULL,
 `possible_values` text,
 `sort_order` tinyint(2) unsigned,
  PRIMARY KEY (`custom_attribute_id`),
  INDEX (`attribute_category`),
  INDEX (`display_label`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `custom_attribute_values`;
CREATE TABLE `custom_attribute_values` (
 `custom_attribute_value_id` mediumint(8) unsigned NOT NULL auto_increment,
 `custom_attribute_id` mediumint(8) unsigned NOT NULL,
 `attribute_value` text NOT NULL,
 `entity_id` mediumint(8) unsigned NOT NULL,
 `attribute_category`  tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_value_id`),
  INDEX (`custom_attribute_id`),
  INDEX `entity_category` (`entity_id`, `attribute_category`),
  INDEX `entity_attribute` (`entity_id`, `custom_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

DROP TABLE IF EXISTS `account_activation`;
CREATE TABLE `account_activation` (
 `account_activation_id` mediumint(8) unsigned NOT NULL auto_increment,
 `user_id` mediumint(8) unsigned NOT NULL,
 `activation_code` varchar(30) NOT NULL,
 `date_created` datetime NOT NULL,
  PRIMARY KEY (`account_activation_id`),
  INDEX (`activation_code`),
  UNIQUE KEY (`user_id`),
  UNIQUE KEY (`activation_code`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;
