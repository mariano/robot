ALTER TABLE `robot_tasks` 
	ADD COLUMN `action` VARCHAR(255),
	ADD COLUMN `weight` INT(11);

UPDATE `robot_tasks` 
JOIN `robot_task_actions` ON (`robot_task_actions`.`id` = `robot_tasks`.`robot_task_action_id`)
SET `robot_tasks`.`action` = `robot_task_actions`.`action`, `robot_tasks`.`weight` = `robot_task_actions`.`weight`;

ALTER TABLE `robot_tasks` 
	CHANGE COLUMN `action` `action` VARCHAR(255) NOT NULL, 
	CHANGE COLUMN `weight` `weight` INT(11) NOT NULL;

ALTER TABLE `robot_tasks`
	ADD INDEX `status__weight__scheduled` (`status`, `weight`, `scheduled`);

