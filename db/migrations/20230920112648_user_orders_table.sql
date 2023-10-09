-- migrate:up
CREATE TABLE `user_orders` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_number` bigint NOT NULL,
  `address_id` int,
  `zipcode` varchar(20) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` int NOT NULL,
  `order_status` int NOT NULL,
  `delivery_fee` decimal NOT NULL,
  `total_order_amount` decimal NOT NULL
);

ALTER TABLE `user_orders` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `user_orders` ADD FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`);
ALTER TABLE `user_orders` ADD FOREIGN KEY (`address_id`) REFERENCES `delivery_address` (`id`);
ALTER TABLE `user_orders` ADD FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`);

-- migrate:down
  DROP TABLE user_orders;
