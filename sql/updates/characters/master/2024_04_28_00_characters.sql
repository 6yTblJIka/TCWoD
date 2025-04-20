ALTER TABLE `characters`
  ADD `bagSlotFlags1` int unsigned NOT NULL DEFAULT '0' AFTER `grantableLevels`,
  ADD `bagSlotFlags2` int unsigned NOT NULL DEFAULT '0' AFTER `bagSlotFlags1`,
  ADD `bagSlotFlags3` int unsigned NOT NULL DEFAULT '0' AFTER `bagSlotFlags2`,
  ADD `bagSlotFlags4` int unsigned NOT NULL DEFAULT '0' AFTER `bagSlotFlags3`,
  ADD `bankBagSlotFlags1` int unsigned NOT NULL DEFAULT '0' AFTER `bagSlotFlags4`,
  ADD `bankBagSlotFlags2` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags1`,
  ADD `bankBagSlotFlags3` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags2`,
  ADD `bankBagSlotFlags4` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags3`,
  ADD `bankBagSlotFlags5` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags4`,
  ADD `bankBagSlotFlags6` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags5`,
  ADD `bankBagSlotFlags7` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags6`,
  ADD `insertItemsLeftToRight` int unsigned NOT NULL DEFAULT '0' AFTER `bankBagSlotFlags7`;
