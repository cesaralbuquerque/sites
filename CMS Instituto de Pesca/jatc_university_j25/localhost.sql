-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.24-log
-- Versão do PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `joomla`
--
CREATE DATABASE `joomla` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `joomla`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_assets`
--

CREATE TABLE IF NOT EXISTS `g2hvq_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Extraindo dados da tabela `g2hvq_assets`
--

INSERT INTO `g2hvq_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 69, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 42, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 43, 46, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 47, 48, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 49, 50, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 51, 52, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 53, 54, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 55, 58, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 59, 62, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 63, 64, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 44, 45, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 60, 61, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 56, 57, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 65, 66, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 67, 68, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 27, 19, 20, 3, 'com_content.article.1', 'Histórico', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_associations`
--

CREATE TABLE IF NOT EXISTS `g2hvq_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_banner_clients`
--

CREATE TABLE IF NOT EXISTS `g2hvq_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `g2hvq_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_banners`
--

CREATE TABLE IF NOT EXISTS `g2hvq_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_categories`
--

CREATE TABLE IF NOT EXISTS `g2hvq_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `g2hvq_categories`
--

INSERT INTO `g2hvq_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_contact_details`
--

CREATE TABLE IF NOT EXISTS `g2hvq_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_content`
--

CREATE TABLE IF NOT EXISTS `g2hvq_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `g2hvq_content`
--

INSERT INTO `g2hvq_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 35, 'Histórico', 'historico', '', '<p style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: normal;" align="center"><span style="color: #0066cc; font-size: x-small;">O Instituto de Pesca, vinculado à Agência Paulista de Tecnologia dos Agronegócios da Secretaria de Agricultura e Abastecimento do Estado de São Paulo, é uma instituição de pesquisa científica e tecnológica que desenvolve projetos nas áreas de pesca e aqüicultura, visando à obtenção e transferência de novos conhecimentos e de tecnologias destinadas à melhoria do agronegócio do pescado e da qualidade ambiental.</span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"> </p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"><span style="color: #0066cc;"><img src="http://www.pesca.sp.gov.br/img_up/img_1082028494.jpg" border="0" alt="" hspace="0" align="baseline" /></span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="justify"><span style="color: #0066cc;"> </span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="right"><strong><span style="color: #0066cc; font-size: small;">(vista frontal, década de 30)</span></strong></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="left"><span style="color: #0066cc; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">Além das instalações destinadas à realização de suas pesquisas, o Instituto conta com espaços privilegiados para o desenvolvimento de atividades educacionais e culturais. Um desses espaços localiza-se no Parque Fernando Costa (conhecido também como "Parque da Água Branca"), uma importante área de lazer da cidade de São Paulo que recebe um grande número de visitantes ao longo do ano: é o "Aquário do Instituto de Pesca", o mais antigo do Estado de São Paulo e o segundo mais antigo do Brasil, construído na década de 30.</span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="left"><span style="color: #ff0000; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">O seu endereço é Avenida Francisco Matarazzo nº 455, metrô Barra Funda. Funciona todos os dias das 9h às 17h, e o valor do ingresso é R$ 2,00, estando isentos crianças até 5 anos, adultos com mais de 65 anos (portando documento) e escolas públicas (agendamento com Ângela, pelo tel: 3865-4130).</span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"> </p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"><strong><span style="color: #0066cc; font-size: small;"><img src="http://www.pesca.sp.gov.br/img_up/img_1082028627.jpg" border="0" alt="" hspace="0" align="baseline" /></span></strong></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="right"><strong><span style="color: #0066cc; font-size: small;">(o prédio visto por detrás, década de 30)</span></strong></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"> </p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="center"><strong><span style="color: #0066cc; font-size: small;"><img src="http://www.pesca.sp.gov.br/img_up/img_1082028697.jpg" border="0" alt="" hspace="0" align="baseline" /></span></strong></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="right"><strong><span style="color: #0066cc; font-size: small;">(vista lateral, década de 30)</span></strong></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="justify"><span style="color: #0066cc; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">O Parque está localizado próximo de três dos maiores centros culturais da cidade: o Memorial da América Latina, o Senac e o Sesc-Pompéia.</span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; line-height: normal;" align="justify"><span style="font-size: xx-small;"><span style="color: #0066cc;"><span style="font-family: Verdana, Arial, Helvetica, sans-serif;">Criado em 1905, numa época de forte desenvolvimento da agropecuária paulista, o Parque destinava-se exclusivamente a abrigar órgãos de pesquisa agropecuária, associações de criadores, leilões e exposições de animais. Hoje tornou-se um grande parque público com características tanto urbanas (abrigando grupos de teatro e dança, de convivência para a terceira idade, etc.) quanto do campo (com diversos animais criados em fazendas, pomar, etc.)</span><span style="font-family: Verdana, Arial, Helvetica, sans-serif;">.</span></span></span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>\r\n<p align="justify"><span style="color: #0066cc; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">A importância do interesse do público pelo "Aquário do Instituto de Pesca" pode ser observada pelos números de visitação: 77.199 em 1998, 113.612 em 1999, 112.372 em 2000, 161.475 em 2001 e 168.395 em 2002, números esses registrados apenas em finais de semana e feriados.</span></p>\r\n<p><span style="color: #0059b5; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: normal; font-size: large;"></span></p>', '', 1, 0, 0, 2, '2013-04-17 12:59:46', 512, '', '0000-00-00 00:00:00', 0, 512, '2013-04-17 13:34:55', '2013-04-17 12:59:46', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `g2hvq_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_content_rating`
--

CREATE TABLE IF NOT EXISTS `g2hvq_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `g2hvq_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_extensions`
--

CREATE TABLE IF NOT EXISTS `g2hvq_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10008 ;

--
-- Extraindo dados da tabela `g2hvq_extensions`
--

INSERT INTO `g2hvq_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0);
INSERT INTO `g2hvq_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.9","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'ja_university', 'template', 'ja_university', '', 0, 1, 1, 0, '{"legacy":false,"name":"ja_university","type":"template","creationDate":"31 August 2012","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"1.0.0","description":"\\t\\n\\t\\n<p>JA University Template for Joomla 2.5<\\/p>\\n\\n<p>JA University will be the choice for your next school or university website project. The template is designed with the aim for simple and minimal design. JA University has various content types. This Joomla template for educational purpose supports the latest version of T3 Framework, K2 component, Slideshow Lite and much more.<\\/p>\\n\\n<p>JA University will meet all the demands of a professional educational website.<\\/p>\\n\\n<p><strong>Note:<\\/strong> JA University does not support RTL language<\\/p>\\n<\\/br>\\n\\n<p><strong>Resources :<\\/strong><\\/p>\\n\\n<p>\\n<a href=''http:\\/\\/www.joomlart.com\\/demo\\/#joomla25-templates.joomlart.com\\/ja_university'' title=''Demo'' target=''_blank'' > Demo<\\/a> |\\n<a href=''http:\\/\\/www.joomlart.com\\/forums\\/forumdisplay.php?396'' title=''forum'' target=''_blank'' >Forum<\\/a> |\\n<a href=''http:\\/\\/wiki.joomlart.com\\/wiki\\/JA_T3_Framework_2\\/Overview'' title=''T3 wiki'' target=''_blank'' >T3 Framework Wiki<\\/a> |\\n<a href=''http:\\/\\/update.joomlart.com'' title=''Updates'' target=''_blank'' >Updates<\\/a> |\\n<a href=''http:\\/\\/pm.joomlart.com\\/browse\\/JATCUNIVER'' title=''Changelog'' target=''_blank'' >JIRA<\\/a> |\\n<a href=''http:\\/\\/www.joomlart.com\\/forums\\/downloads.php?do=cat&id=456'' title=''Downloads'' target=''_blank'' >Downloads<\\/a> <\\/p>\\n\\t\\t\\n\\t\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'JA T3 Framework', 'plugin', 'jat3', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"JA T3 Framework","type":"plugin","creationDate":"August 2012","author":"www.JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.5.4","description":"\\n\\t\\n\\t\\t<h1>T3 Framework - JoomlArt Template Framework for Joomla 2.5<\\/h1>\\n\\t\\t<div style=''font-weight: normal''>\\n\\t\\t<p><span style=''color: #ff6600;''>\\n\\t\\t<strong>Features:<\\/strong><\\/span>\\n\\t\\tThis plugin is required for JA T3 Framework based templates to work.<\\/p>\\n\\t\\t\\n\\t\\t<strong><span style=''color: #ff0000;''>Usage Instruction:<\\/span><\\/strong><br \\/>\\n\\t\\t<ul>\\n\\t\\t<li>Enable the JA T3 plugin in Plugin manager<\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<strong><span style=''color: #ff0000;''>Upgrade Method:<\\/span><br \\/><\\/strong>\\n\\t\\t<ul>\\n\\t\\t  <li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t  <li>Follow upgrade instructions and backup site \\/ plugin before upgrading<\\/li>\\n\\t\\t  <\\/ul>\\n\\t\\n\\t\\t<span style=''color: #008000;''><strong>Links:<\\/strong><\\/span><br \\/>\\n\\t\\t<ul>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/wiki.joomlart.com\\/wiki\\/JA_T3_Framework_2\\/Overview\\">Wiki Userguide<\\/a><\\/li>\\n\\t\\t <li><a target=''_blank'' href=''http:\\/\\/update.joomlart.com\\/''>Updates &amp; Versions<\\/a><\\/li>\\n\\t\\t <li><a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/forumdisplay.php?241''>JA T3 Framework Forum<\\/a><\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p>Copyright 2004 - 2012 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1000, 0),
(10002, 'JA Content Slider', 'module', 'mod_jacontentslider', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Content Slider","type":"module","creationDate":"31 August 2012","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.6","description":"\\n\\t\\n\\t \\t<style type=\\"text\\/css\\">\\n\\t \\t\\t.mod-desc li{\\n\\t\\t\\t\\tbackground: url(\\"..\\/modules\\/mod_jacontentslider\\/elements\\/assets\\/images\\/arrow-level1.png\\") no-repeat left 10px;\\n\\t\\t\\t\\tmargin-left:10px;\\n\\t\\t\\t\\tpadding-left:12px;\\n\\t\\t\\t}\\n\\t\\t\\t.mod-desc p{\\n\\t\\t\\t\\tmargin:15px 0;\\n\\t\\t\\t}\\n\\t \\t<\\/style>\\n\\t \\t<span style=\\"color: #008000;\\"><strong>JA Content Slider Module for Joomla! 2.5<\\/strong><\\/span><br \\/>\\n\\t \\t<p><img alt=\\"JA Content Slider Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_contentslider.png\\" \\/><\\/p>\\n\\t\\t<div style=''font-weight:normal''>\\n\\t \\tSlide your articles from Joomla categories with cool effects, rich backend configs covering layout, animation control, auto thumbnail creation, images size, number of articles, sorting and much more\\n\\t \\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Important Instruction:<\\/strong><\\/span><\\/p>\\n\\t\\tCheck in configuration in your site if it does not have this line \\"var $absolute_path by ''your absolute path'';\\" you have to add its there to run.\\n\\t\\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Brief features:<\\/strong><\\/span><\\/p>\\n\\t \\t<ul>\\n\\t\\t\\t  <li>Slide your content with width and height properties.<\\/li>\\n\\t\\t\\t  <li>You can set the number of content to display in a tab.<\\/li>\\n\\t\\t\\t  <li>You can set categories contents to display.<\\/li>\\n\\t\\t\\t  <li>You can set display title, link title, introtext, readmore text links or not.<\\/li>\\n\\t\\t\\t  <li>You can set the slide to auto run or not. Default is YES.<\\/li>\\n\\t\\t\\t  <li>Set direction of slide. Default is left.<\\/li>\\n\\t\\t\\t  <li>Set time for rolling delay time and animation time.<\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading. OR<\\/li><li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li><\\/ol>\\n\\t\\t<p><span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t<ul><li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?51825\\">JA Content Slider Userguide<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JAECMODJACSLIDERJVI\\">Report Bug<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/\\">Updates &amp; Versions<\\/a><\\/li><\\/ul>\\n\\t\\t<p>Copyright 2004 - 2012 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":""}', '{"moduleclass_sfx":"","settingcontent":"","source":"content","folder_images":"","catid":"","k2catsid":"","text_heading":"","showTab":"1","sort_order_field":"created","sort_order":"DESC","numElem":"3","maxitems":"10","showtitle":"1","link_titles":"1","showimages":"1","iwidth":"130","iheight":"90","showreadmore":"0","showintrotext":"1","numchar":"50","settingdisplay":"","xwidth":"140","xheight":"170","auto":"0","mode":"horizontal","direction":"left","delaytime":"5000","animationtime":"1000","showbutton":"1","scroll_when":"click","source-articles-images-thumbnail_mode":"crop","source-articles-images-thumbnail_mode-resize-use_ratio":"0","enable_cache":"1","cache_time":"300"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'JA Facebook Activity Module', 'module', 'mod_jafacebookactivity', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Facebook Activity Module","type":"module","creationDate":"February 2012","author":"JoomlArt.com","copyright":"J.O.O.M Solutions Co., Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.1","description":"\\n     \\t\\n\\t\\t<h1>JA Facebook Activity Module for Joomla! 2.5<\\/h1>\\n\\t\\t<div style=''font-weight: normal''>\\n\\t\\t\\t<br \\/><br \\/>\\n\\t\\t\\t<p><span style=''color: #ff6600;''><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t\\t\\t<img border=''0'' alt=''JA FACEBOOK ACTIVITY'' src=''http:\\/\\/asset.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/jaec_facebook_activity_mod.png?javer=1110041026'' style=''float: left''>This module is filled with activity from the user''s friends. If there is not enough friend activity to fill in the content, it is autofilled with recommendations. If you set the recommendations parameter to \\"Yes\\", the module is split into two parts: top half shows friends activities, and the bottom show recommendations. If there is not enough friends activities to fill, module will include more recommendations.\\n\\t\\t\\t<br \\/><br \\/>\\n\\t\\t\\t\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<p><strong><span style=''color: #ff0000;''>Upgrade Method:<\\/span><br \\/>\\n\\t\\t\\t  <\\/strong><\\/p>\\n\\t\\t\\t<ol>\\n\\t\\t\\t  <li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t\\t  <li>Backup any customized files before upgrading.<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<p><span style=''color: #008000;''><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t\\t<ul>\\n\\t\\t\\t  <li><a target=''_blank'' href=''http:\\/\\/update.joomlart.com\\/''>Updates &amp; Versions<\\/a><\\/li>\\n\\t\\t\\t  <li><a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?51021''>General Userguide<\\/a><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<p>Copyright 2004 - 2012 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","site":"www.joomlart.com","header":"1","recommendations":"0","width":"300","height":"400","colorscheme":"light","font":"","border_color":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'JA Facebook Like Box Module', 'module', 'mod_jafacebooklikebox', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Facebook Like Box Module","type":"module","creationDate":"August 2012","author":"JoomlArt.com","copyright":"J.O.O.M Solutions Co., Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.3","description":"\\n\\t \\n\\t \\t<style type=\\"text\\/css\\">\\n\\t \\t\\t.mod-desc li{\\n\\t\\t\\t\\tbackground: url(\\"..\\/modules\\/mod_jafacebooklikebox\\/elements\\/assets\\/images\\/arrow-level1.png\\") no-repeat left 10px;\\n\\t\\t\\t\\tmargin-left:10px;\\n\\t\\t\\t\\tpadding-left:12px;\\n\\t\\t\\t}\\n\\t\\t\\t.mod-desc p{\\n\\t\\t\\t\\tmargin:15px 0;\\n\\t\\t\\t}\\n\\t \\t<\\/style>\\n\\t \\t<span style=\\"color: #008000;\\"><strong>JA Facebook LikeBox Module for Joomla! 2.5<\\/strong><\\/span><br \\/>\\n\\t \\t<p><img alt=\\"JA Facebook LikeBox Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/jaec_facebook_likebox_plg.png\\" \\/><\\/p>\\n\\t\\t<div style=''font-weight:normal''>\\n\\t \\tJA Facebook LikeBox Module, provides Facebook Page owners to attract and gain Likes from their own website content, it uses the <strong><a href=\\"http:\\/\\/developers.facebook.com\\/docs\\/reference\\/plugins\\/like-box\\" target=\\"_blank\\">FaceBook LikeBox<\\/a><\\/strong> API. \\n\\t \\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t \\t<ol><li>Show how many users already like your page, and which of their friends like it too<\\/li>\\n\\t\\t<li>Like the page with one click.<\\/li><\\/ol>\\n\\t \\t\\n\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Methods:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. Backup any customized file before upgrading. OR<\\/li><li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li><\\/ol>\\n\\t\\t<p><span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t<ul><li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?49870\\">JA FaceBook LikeBox General Userguide<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JAECMODFBLIKEBOXJIVI\\">Report Bug<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/\\">Updates &amp; Versions<\\/a><\\/li><\\/ul>\\n\\t\\t<p>Copyright 2004 - 2012 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":""}', '{"moduleclass_sfx":"","jafacebookid":"123144964369587","connections":"10","stream":"1","header":"1","width":"300","height":"587","colorscheme":"1","border_color":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'JA Masshead', 'module', 'mod_jamasshead', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Masshead","type":"module","creationDate":"August 2012","author":"Unknown","copyright":"J.O.O.M Solutions Co., Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.2","description":"\\n\\t\\t\\t\\n\\t\\t\\t<h1>JA Masshead Module for Joomla! 2.5<\\/h1>\\n\\t\\t\\t<div style=''font-weight: normal''>\\n\\t\\t\\t<p>Please refer to the backend settings of the demo template quickstart for usage examples and also refer to <a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?64198''>General Userguide<\\/a> for details.<\\/strong><\\/p>\\n\\t\\t\\t<p><span style=''color: #ff6600;''><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t\\t\\tJA Masshead Module displays masshead title like the JoomlArt masshead. Title and description can be specifically configured for any pages.\\n\\t\\t\\t<p><strong><span style=''color: #ff0000;''>Usage Instruction:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t\\t<strong>The configuration field use 2 formats:<\\/strong> <br \\/>\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li>Format 1: <code>[Masshead option=\\"com_name\\" view=\\"view_name\\" layout=\\"layout_name\\" task=\\"task_name\\" id=\\"id\\" title=\\"Title\\" ]Description here[\\/Masshead]<\\/code><\\/li>\\n      \\t\\t\\t\\t<li>Format 2: <code>[Masshead Itemid=\\"page_id_1,page_id_2,...\\" title=\\"Title\\" ]Description here[\\/Masshead]<\\/code><\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong>If configuration field is empty:<\\/strong>\\t\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li>If this is an article view: use the Article title as Masshead title, Article metadesc as masshead description<\\/li>\\n      \\t\\t\\t\\t<li>If not: use the Page title as Mass title.<\\/li>\\n      \\t\\t\\t\\t<li>If no value for Title & Description, use default value.<\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br \\/>\\t\\n\\t\\t\\t<strong>If configuration field is updated:<\\/strong><br \\/> \\n\\t\\t\\t\\t<ol>\\n\\t\\t\\t\\t\\t<li>Use that value<\\/li>\\n\\t\\t\\t\\t\\t<li>Support multiple configs, each config on a line; eg: <br \\/>\\n\\t\\t\\t\\t\\t\\t<code>\\n\\t\\t\\t\\t\\t\\t[Masshead option=\\"com_name1\\" view=\\"view_name1\\" layout=\\"layout_name1\\" task=\\"task_name1\\" id=\\"id1\\" title=\\"Title1\\" ]Description 1 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead option=\\"com_name2\\" view=\\"view_name1\\" layout=\\"layout_name2\\" task=\\"task_name2\\" id=\\"id2\\" title=\\"Title2\\" ]Description 2 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead Itemid=\\"page_id1_1,page_id1_2,...\\" title=\\"Title page 1\\" ]Description page 1 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead Itemid=\\"page_id2_1,page_id2_2,...\\" title=\\"Title page 2\\" ]Description page 2 here[\\/Masshead]\\n\\t\\t\\t\\t\\t\\t<\\/code>\\n\\t\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t\\t\\t<li>If config sets multiple conditions, then the module will prefer to the first condition only and ignore the rest.<\\/li>\\n\\t\\t\\t\\t<\\/ol>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong>Use extra paramaters:<\\/strong><br \\/> \\t\\t\\t\\t\\n\\t\\t\\t<ol>\\n\\t\\t\\t\\t<li>Extra parameters can put in config as <b>name=\\"value\\"<\\/b> and access through variables <b>$masshead[''params''][''name'']<\\/b> by overwritting module layout in the template<\\/li>\\n\\t\\t\\t\\t<li>Eg: <br ?>\\n\\t\\t\\t\\t\\t<code>[Masshead Itemid=\\"page_id\\" title=\\"Title\\" <span style=\\"color:red\\">background=\\"image url\\"<\\/span>]Description[\\/Masshead]<\\/code>\\n\\t\\t\\t\\t<br \\/>\\n\\t\\t\\t\\tAccess the param background: <br \\/>\\n\\t\\t\\t\\t<code>\\n\\t\\t\\t\\t\\t&lt;div class=&quot;jamasshead&quot; <span style=\\"color:red\\">&lt;?php if(isset($masshead[''params''][''background''])): ?&gt;<\\/span> style=&quot;background-image: url(<span style=\\"color:red\\">&lt;?php echo $masshead[''params''][''background''] ?&gt;<\\/span>)&quot; <span style=\\"color:red\\">&lt;?php endif; ?&gt;<\\/span>&gt;\\n\\t\\t\\t\\t<\\/code>\\n\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t\\n\\t\\t\\t<p><strong><span style=''color: #ff0000;''>Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t\\t\\t<li>Backup any customized files before upgrading.<\\/li><\\/ol>\\n\\t\\t\\t<p><span style=''color: #008000;''><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t\\t  <ul><li><a target=''_blank'' href=''http:\\/\\/update.joomlart.com\\/''>Updates &amp; Versions<\\/a><\\/li><li><a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?64198''>General Userguide<\\/a><\\/li><\\/ul>\\t\\t\\t\\n\\t\\t\\t<p>Copyright 2004 - 2012 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":""}', '{"default-title":"","default-description":"","config":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'JA Side News', 'module', 'mod_jasidenews', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Side News","type":"module","creationDate":"August 2012","author":"Joomlart.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.5.5","description":"\\n\\t\\t\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>JA Side News Module for Joomla 2.5<\\/strong><\\/span><br \\/>\\n\\t\\t\\t<p><img alt=\\"JA Side News Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_sidenews.png\\" \\/><\\/p>\\n\\t\\t\\t<div style=\\"font-weight:normal\\">\\n\\t\\t\\tJA Side News module allows to display a list of articles with meta keyword ''''Featured'''' (this word is declared in the ''''Keyword'''' parameter inside the Metadata Information of each article).\\n\\t\\t\\t<p>Otherwise, it displays articles from one or many categories. The list can be sorted by Date, Order or Hits.<\\/p>\\n\\t\\t\\t\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<span style=\\"color: #ff6600;\\"><strong>Features:<\\/strong><\\/span><br\\/>\\n\\t\\t\\t<ul>\\n\\t\\t\\t  <li>2 display layouts to choose from.<\\/li>\\n\\t\\t\\t  <li>Configure image sizes, dates and even read more button.<\\/li>\\n\\t\\t\\t  <li>Choose sidenews layout for text overlay effect.<\\/li>\\n\\t\\t\\t  <li>Easy to configure colors for overlay, text. Control animation with easy dimensions.<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong><span style=\\"color: #ff0000;\\">Upgrade Methods:<\\/span><\\/strong><br \\/>\\n\\n\\t\\t\\t<ul>\\n\\t\\t\\t   <li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading OR<\\/li>\\n\\t\\t\\t  <li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video.<\\/a><\\/strong><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br\\/>\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span>\\n\\t\\t\\t<ul>\\n\\t\\t\\t  <li><a target=''_blank'' href=''http:\\/\\/update.joomlart.com\\/''>Updates &amp; Versions<\\/a><\\/li><li><a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?49940''>General Userguide<\\/a><\\/li>\\n\\t\\t\\t  <li>For more details on Thumbnail modes read this <a href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?50325\\" title=\\"JA thumbanil modes\\" target=\\"_blank\\"><strong>tutorial<\\/strong><\\/a><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<p>Copyright 2004 - 2012 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\n\\t\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","settingcontent":"","using_mode":"article","display_model":"modcats","display_model-modcats-category":"","k2catsid":"","show_featured":"1","sort_order_field":"created","sort_order":"DESC","max_items":"5","title_max_chars":"200","maxchars":"60","settingimg":"","thumbnail_mode":"crop","thumbnail_mode-resize-use_ratio":"1","iwidth":"152","iheight":"200","image_alignment":"left","settinglayout":"","layout":"default","layout-default-showdate":"1","layout-default-show_moredetail":"1","layout-default-showimage":"1","layout-sidenews-height":"200","layout-sidenews-textcolor":"FFFFFF","layout-sidenews-bgcolor":"4F4F4F","layout-sidenews-transparent":"80","layout-sidenews-element_apply_side":"content","layout-sidenews-play_mode":"caption","layout-sidenews-play_mode-caption-expandheight":"150","layout-sidenews-play_mode-caption-collapseheight":"30","layout-sidenews-animation_transition":"Fx.Transitions.Expo.easeOut","enable_cache":"1","cache_time":"30"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'JA Slideshow Lite', 'module', 'mod_jaslideshowlite', '', 0, 1, 0, 0, '{"legacy":false,"name":"JA Slideshow Lite","type":"module","creationDate":"31 August 2012","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"1.0.8","description":"\\n\\t\\t\\n\\t\\t<h1>JA Slideshow Lite module for Joomla! 2.5<\\/h1>\\n\\t\\t<div style=''font-weight: normal''>\\n\\t\\t\\t<p><span style=''color: #ff6600;''><strong>Features:<\\/strong><\\/span>Display images from a folder. Includes auto-resized images, beautiful animation effects, and inline text-embeded descriptions. This module use css3 to enable animation effects and support responsive design<\\/p>\\n\\t\\t\\t<strong><span style=''color: #ff0000;''>Usage Instructions:<\\/span><\\/strong><br \\/>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li><strong>The module display can be enhanced by CSS overrides in the demo templates. You may have to customize CSS to get your desired effects.<\\/strong><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<strong style=''color: #ff0000;''>Configuration<\\/strong>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Fade, Slide, Verticle Rotate, Horizontal Rotate, Rotate are easy and straingt forward.<\\/li>\\n\\t\\t\\t\\t<li>\\n\\t\\t\\t\\t\\t<strong style=\\"color: #ff3300\\">Custom<\\/strong>\\n\\t\\t\\t\\t\\t<ul style=\\"list-style: disc\\">\\n\\t\\t\\t\\t\\t\\t<li>Custom Slideshow Type required a set of images. All images must have the name in format [slideItemNo-typeOfImage.imageExt]. For ex: sl1-bg, sl1-first, sl2-bg. The first part is the slide identity and should be the same for all 3 images for a slide item. The second part should be named to \\"bg\\", \\"first\\", \\"second\\". Each slide item required a \\"bg\\" image type and have two optional \\"first\\" or \\"last\\" image types.<\\/li>\\n\\t\\t\\t\\t\\t\\t<li><strong>Advanced Configuration<\\/strong>\\n\\t\\t\\t\\t\\t\\t\\t<ul style=\\"padding-left: 20px\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t<li style=\\"list-style: disc\\">[img] property should point to \\"bg\\" image type.<\\/li>\\n\\t\\t\\t\\t\\t\\t\\t\\t<li style=\\"list-style: disc\\">[class] property should be one of [leftright, leftleft, rightright, updown, downdown, rupdown, rupup].<\\/li>\\n\\t\\t\\t\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<p>Copyright 2004 - 2012 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","folder":"\\/images\\/sampledata\\/slideshow","type":"fade","autoplay":"1","thumbnail":"1","navigation":"1","description":"","thumbWidth":"60","thumbHeight":"60","mainWidth":"auto","mainHeight":"auto","enable_cache":"1","cache_time":"30"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_filters`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `g2hvq_finder_taxonomy`
--

INSERT INTO `g2hvq_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_terms`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `g2hvq_finder_terms_common`
--

INSERT INTO `g2hvq_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_finder_types`
--

CREATE TABLE IF NOT EXISTS `g2hvq_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_languages`
--

CREATE TABLE IF NOT EXISTS `g2hvq_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `g2hvq_languages`
--

INSERT INTO `g2hvq_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_menu`
--

CREATE TABLE IF NOT EXISTS `g2hvq_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Extraindo dados da tabela `g2hvq_menu`
--

INSERT INTO `g2hvq_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 45, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 41, 42, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 35, 40, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 36, 37, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 38, 39, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 41, 42, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 1, '*', 0),
(102, 'mainmenu', 'Aquário do Instituto', 'aquario-do-instituto', '', 'aquario-do-instituto', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"mega_showtitle":"1","mega_desc":"","mega_cols":"1","mega_group":"0","mega_width":"","mega_colw":"","mega_colxw":"","mega_class":"","mega_subcontent":"0"}', 43, 44, 0, '*', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_menu_types`
--

CREATE TABLE IF NOT EXISTS `g2hvq_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `g2hvq_menu_types`
--

INSERT INTO `g2hvq_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'menu-topo', 'Menu do topo', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_messages`
--

CREATE TABLE IF NOT EXISTS `g2hvq_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `g2hvq_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_modules`
--

CREATE TABLE IF NOT EXISTS `g2hvq_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Extraindo dados da tabela `g2hvq_modules`
--

INSERT INTO `g2hvq_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'Menu do topo', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(88, 'JA Content Slider', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jacontentslider', 1, 1, '', 0, '*'),
(89, 'JA Facebook Activity Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jafacebookactivity', 1, 1, '', 0, '*'),
(90, 'JA Facebook Like Box Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jafacebooklikebox', 1, 1, '', 0, '*'),
(91, 'JA Masshead', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jamasshead', 1, 1, '', 0, '*'),
(92, 'JA Side News', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jasidenews', 1, 1, '', 0, '*'),
(93, 'JA Slideshow Lite', '', '', 1, 'slideshow', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jaslideshowlite', 1, 1, '{"moduleclass_sfx":"","folder":"\\/images\\/sampledata\\/parks\\/landscape","type":"fade","autoplay":"0","thumbnail":"0","navigation":"1","description":"","thumbWidth":"11","thumbHeight":"11","mainWidth":"960","mainHeight":"400","enable_cache":0,"cache_time":30}', 0, '*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_modules_menu`
--

CREATE TABLE IF NOT EXISTS `g2hvq_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `g2hvq_modules_menu`
--

INSERT INTO `g2hvq_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(93, 101);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `g2hvq_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_overrider`
--

CREATE TABLE IF NOT EXISTS `g2hvq_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_redirect_links`
--

CREATE TABLE IF NOT EXISTS `g2hvq_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_schemas`
--

CREATE TABLE IF NOT EXISTS `g2hvq_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `g2hvq_schemas`
--

INSERT INTO `g2hvq_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.9');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_session`
--

CREATE TABLE IF NOT EXISTS `g2hvq_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `g2hvq_session`
--

INSERT INTO `g2hvq_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('21tqceftivi91g2jci43uj6ge4', 0, 1, '1366205377', '__default|a:8:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1366205377;s:18:"session.timer.last";i:1366205377;s:17:"session.timer.now";i:1366205377;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";N;s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"262d2a87bd2d9d97882db8bdcc40dbf5";}', 0, '', ''),
('g9ajjp45819otn370kdqtrdfi5', 0, 1, '1366205666', '__default|a:9:{s:15:"session.counter";i:65;s:19:"session.timer.start";i:1366202742;s:18:"session.timer.last";i:1366205663;s:17:"session.timer.now";i:1366205666;s:22:"session.client.browser";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"dd908dcf99d5edbf08626d74ce2c2c65";s:16:"com_mailto.links";a:1:{s:40:"73b26c82d9bc9f3cb5ca91f3bbdc33b9da286878";O:8:"stdClass":2:{s:4:"link";s:57:"http://localhost:90/Joomla/index.php/aquario-do-instituto";s:6:"expiry";i:1366205546;}}}', 0, '', ''),
('imrpvesta0o91mvhtefcckmmo5', 1, 0, '1366205696', '__default|a:8:{s:15:"session.counter";i:170;s:19:"session.timer.start";i:1366202743;s:18:"session.timer.last";i:1366205695;s:17:"session.timer.now";i:1366205695;s:22:"session.client.browser";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":10:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":3:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";s:12:"redirect_url";N;}s:13:"com_templates";O:8:"stdClass":2:{s:6:"styles";O:8:"stdClass":1:{s:10:"limitstart";i:0;}s:4:"edit";O:8:"stdClass":1:{s:5:"style";O:8:"stdClass":2:{s:2:"id";a:1:{i:0;i:7;}s:4:"data";N;}}}s:11:"com_content";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":1:{s:7:"article";O:8:"stdClass":2:{s:4:"data";N;s:2:"id";a:1:{i:0;i:1;}}}}s:9:"com_menus";O:8:"stdClass":2:{s:5:"items";O:8:"stdClass":2:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}s:10:"limitstart";i:0;}s:4:"edit";O:8:"stdClass":2:{s:4:"item";O:8:"stdClass":4:{s:4:"data";N;s:4:"type";N;s:4:"link";N;s:2:"id";a:0:{}}s:4:"menu";O:8:"stdClass":1:{s:4:"data";N;}}}s:4:"item";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}}s:11:"com_modules";O:8:"stdClass":4:{s:7:"modules";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:18:"client_id_previous";i:0;}}s:4:"edit";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:2:"id";a:0:{}s:4:"data";N;}}s:3:"add";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:12:"extension_id";N;s:6:"params";N;}}s:9:"positions";O:8:"stdClass":4:{s:6:"filter";O:8:"stdClass":4:{s:6:"search";s:0:"";s:5:"state";s:0:"";s:8:"template";s:13:"ja_university";s:4:"type";s:0:"";}s:10:"limitstart";s:2:"20";s:8:"ordercol";s:5:"value";s:9:"orderdirn";s:3:"asc";}}s:6:"global";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:20;}}s:11:"com_checkin";O:8:"stdClass":1:{s:7:"checkin";O:8:"stdClass":1:{s:8:"ordercol";s:5:"table";}}s:9:"com_cache";O:8:"stdClass":1:{s:5:"cache";O:8:"stdClass":1:{s:8:"ordercol";s:5:"group";}}}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:1;s:2:"id";s:3:"512";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:23:"cesar@geosapiens.com.br";s:8:"password";s:65:"98d7c1937d37088dfdb1904fdd4da98a:fZxtTsTIOUjWxaySygHP4GGE5SJCiW2x";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"deprecated";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-04-17 12:45:30";s:13:"lastvisitDate";s:19:"0000-00-00 00:00:00";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\0*\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"0189bd0e40c39ddbcb9b620f77f85ff2";}', 512, 'admin', ''),
('n21hi4rpmkjn60sdjhc3brq6s4', 0, 1, '1366205630', '__default|a:7:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1366205628;s:18:"session.timer.last";i:1366205628;s:17:"session.timer.now";i:1366205630;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}}', 0, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_template_styles`
--

CREATE TABLE IF NOT EXISTS `g2hvq_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `g2hvq_template_styles`
--

INSERT INTO `g2hvq_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}'),
(7, 'ja_university', 0, '1', 'ja_university - Default', '{}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_update_categories`
--

CREATE TABLE IF NOT EXISTS `g2hvq_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_update_sites`
--

CREATE TABLE IF NOT EXISTS `g2hvq_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `g2hvq_update_sites`
--

INSERT INTO `g2hvq_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1366202752),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1366202752),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 1, 1366202753),
(4, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1366203189);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `g2hvq_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Extraindo dados da tabela `g2hvq_update_sites_extensions`
--

INSERT INTO `g2hvq_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 10001),
(4, 10006),
(4, 10007);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_updates`
--

CREATE TABLE IF NOT EXISTS `g2hvq_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=235 ;

--
-- Extraindo dados da tabela `g2hvq_updates`
--

INSERT INTO `g2hvq_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', ''),
(2, 3, 0, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', ''),
(3, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.9.2', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(4, 3, 0, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', ''),
(5, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(6, 3, 0, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', ''),
(7, 3, 0, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', ''),
(8, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(9, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(10, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(11, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(12, 3, 0, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', ''),
(13, 3, 0, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', ''),
(14, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(15, 3, 0, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', ''),
(16, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(17, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(18, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.5.3', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(19, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(20, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(21, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(22, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(23, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(24, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(25, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.2', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(26, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(27, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(28, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(29, 3, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(30, 3, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(31, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(32, 3, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(33, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(34, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(35, 3, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(36, 3, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.8.4', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(37, 3, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(38, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(39, 3, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(40, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(41, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(42, 3, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(43, 3, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(44, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(45, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(46, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(47, 3, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(48, 3, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(49, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(50, 3, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(51, 3, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(52, 3, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(53, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(54, 3, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(55, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(56, 3, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(57, 3, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(58, 3, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(59, 3, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(60, 3, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(61, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(62, 4, 0, 0, 'JA Amazon S3 for joomla 16', '', 'com_com_jaamazons3', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml', ''),
(63, 4, 0, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', ''),
(64, 4, 0, 0, 'JA Amazon S3 for joomla 2.5 & 3.0', '', 'com_jaamazons3', 'component', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml', ''),
(65, 4, 0, 0, 'JA Comment Package for Joomla 2.5 & 3.0', '', 'com_jacomment', 'component', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/com_jacomment.xml', ''),
(66, 4, 0, 0, 'JA Extenstion Manager Component for J25 & J30', '', 'com_jaextmanager', 'component', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml', ''),
(67, 4, 0, 0, 'JA Google Storage Package for J2.5 & J3.0', '', 'com_jagooglestorage', 'component', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml', ''),
(68, 4, 0, 0, 'JA Job Board Package For J25', '', 'com_jajobboard', 'component', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml', ''),
(69, 4, 0, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2filter', 'component', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', ''),
(70, 4, 0, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2fiter', 'component', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml', ''),
(71, 4, 0, 0, 'JA Showcase component for Joomla 1.7', '', 'com_jashowcase', 'component', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml', ''),
(72, 4, 0, 0, 'JA Voice component for Joomla 1.7', '', 'com_javoice', 'component', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_javoice.xml', ''),
(73, 4, 0, 0, 'JA Anion template for Joomla 2.5', '', 'ja_anion', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_anion.xml', ''),
(74, 4, 0, 0, 'JA Argo Template', '', 'ja_argo', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', ''),
(75, 4, 0, 0, 'JA Bistro Template for Joomla 2.5', '', 'ja_bistro', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_bistro.xml', ''),
(76, 4, 0, 0, 'JA Blazes Template for J25 & J30', '', 'ja_blazes', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_blazes.xml', ''),
(77, 4, 0, 0, 'JA Brisk Template', '', 'ja_brisk', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_brisk.xml', ''),
(78, 4, 0, 0, 'JA Business Template for Joomla 2.5', '', 'ja_business', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_business.xml', ''),
(79, 4, 0, 0, 'JA Cloris Template for Joomla 2.5.x', '', 'ja_cloris', 'template', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_cloris.xml', ''),
(80, 4, 0, 0, 'JA Community PLus Template for Joomla 2.5', '', 'ja_community_plus', 'template', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml', ''),
(81, 4, 0, 0, 'JA Droid Template for Joomla 2.5', '', 'ja_droid', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_droid.xml', ''),
(82, 4, 0, 0, 'JA Edenite Template for J25 & J30', '', 'ja_edenite', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_edenite.xml', ''),
(83, 4, 0, 0, 'JA Elastica Template for Joomla 2.5', '', 'ja_elastica', 'template', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_elastica.xml', ''),
(84, 4, 0, 0, 'JA Erio Template for Joomla 2.5', '', 'ja_erio', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_erio.xml', ''),
(85, 4, 0, 0, 'Ja Events Template for Joomla 2.5', '', 'ja_events', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_events.xml', ''),
(86, 4, 0, 0, 'JA Fubix Template for J25 & J30', '', 'ja_fubix', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_fubix.xml', ''),
(87, 4, 0, 0, 'JA Graphite Template for Joomla 2.5', '', 'ja_graphite', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_graphite.xml', ''),
(88, 4, 0, 0, 'JA Ironis Template for Joomla 2.5', '', 'ja_ironis', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_ironis.xml', ''),
(89, 4, 0, 0, 'JA Kranos Template for J25 & J30', '', 'ja_kranos', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_kranos.xml', ''),
(90, 4, 0, 0, 'JA Lens Template for Joomla 2.5', '', 'ja_lens', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_lens.xml', ''),
(91, 4, 0, 0, 'Ja Lime Template for Joomla 2.5', '', 'ja_lime', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_lime.xml', ''),
(92, 4, 0, 0, 'JA Mendozite Template for J25 & J30', '', 'ja_mendozite', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml', ''),
(93, 4, 0, 0, 'JA Mero Template', '', 'ja_mero', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_mero.xml', ''),
(94, 4, 0, 0, 'JA Mers Template for J25 & J30', '', 'ja_mers', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mers.xml', ''),
(95, 4, 0, 0, 'JA Methys Template for Joomla 2.5', '', 'ja_methys', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_methys.xml', ''),
(96, 4, 0, 0, 'Ja Minisite Template for Joomla 2.5', '', 'ja_minisite', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_minisite.xml', ''),
(97, 4, 0, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', ''),
(98, 4, 0, 0, 'JA Mixmaz Template', '', 'ja_mixmaz', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml', ''),
(99, 4, 0, 0, 'JA Nex Template for J25 & J30', '', 'ja_nex', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex.xml', ''),
(100, 4, 0, 0, 'JA Norite Template for Joomla 2.5', '', 'ja_norite', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_norite.xml', ''),
(101, 4, 0, 0, 'JA Onepage Template', '', 'ja_onepage', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_onepage.xml', ''),
(102, 4, 0, 0, 'JA ores template for Joomla 2.5', '', 'ja_ores', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_ores.xml', ''),
(103, 4, 0, 0, 'JA Orisite Template  for J25 & J30', '', 'ja_orisite', 'template', '', 0, '1.1.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_orisite.xml', ''),
(104, 4, 0, 0, 'JA Portfolio Real Estate template for Joomla 1.6.x', '', 'ja_portfolio', 'file', '', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml', ''),
(105, 4, 0, 0, 'JA Portfolio Template for Joomla 2.5', '', 'ja_portfolio_real_estate', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml', ''),
(106, 4, 0, 0, 'JA Puresite Template for J25 & J30', '', 'ja_puresite', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', ''),
(107, 4, 0, 0, 'JA Purity II template for Joomla 2.5', '', 'ja_purity_ii', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', ''),
(108, 4, 0, 0, 'JA Pyro Template for Joomla 2.5', '', 'ja_pyro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', ''),
(109, 4, 0, 0, 'JA Rasite Template for Joomla 2.5', '', 'ja_rasite', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_rasite.xml', ''),
(110, 4, 0, 0, 'JA Rave Template for Joomla 2.5', '', 'ja_rave', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_rave.xml', ''),
(111, 4, 0, 0, 'JA Social Template for Joomla 2.5', '', 'ja_social', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_social.xml', ''),
(112, 4, 0, 0, 'JA System Pager plugin for J25 & J30', '', 'ja_system_japager', 'plugin', 'ja_system_japager', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml', ''),
(113, 4, 0, 0, 'JA T3V2 Blank Template', '', 'ja_t3_blank', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml', ''),
(114, 4, 0, 0, 'JA T3 Blank template for joomla 1.6', '', 'ja_t3_blank_j16', 'template', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml', ''),
(115, 4, 0, 0, 'JA Blank Template for T3v3', '', 'ja_t3v3_blank', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml', ''),
(116, 4, 0, 0, 'JA Teline III  Template for Joomla 1.6', '', 'ja_teline_iii', 'file', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml', ''),
(117, 4, 0, 0, 'JA Teline IV Template for Joomla 2.5', '', 'ja_teline_iv', 'template', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml', ''),
(118, 4, 0, 0, 'JA Tiris Template for J25 & J30', '', 'ja_tiris', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_tiris.xml', ''),
(119, 4, 0, 0, 'JA Travel Template for Joomla 2.5 & 3.0', '', 'ja_travel', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_travel.xml', ''),
(120, 4, 10000, 0, 'JA University Template for J25 & J30', '', 'ja_university', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_university.xml', ''),
(121, 4, 0, 0, 'JA Vintas Template for J25 & J30', '', 'ja_vintas', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_vintas.xml', ''),
(122, 4, 0, 0, 'JA Wall Template for J25 & J30', '', 'ja_wall', 'template', '', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_wall.xml', ''),
(123, 4, 0, 0, 'JA ZiteTemplate', '', 'ja_zite', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_zite.xml', ''),
(124, 4, 0, 0, 'JA Bookmark plugin for Joomla 1.6.x', '', 'jabookmark', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jabookmark.xml', ''),
(125, 4, 0, 0, 'JA Comment plugin for Joomla 1.6.x', '', 'jacomment', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacomment.xml', ''),
(126, 4, 0, 0, 'JA Comment Off Plugin for Joomla 1.6', '', 'jacommentoff', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommentoff.xml', ''),
(127, 4, 0, 0, 'JA Comment On Plugin for Joomla 1.6', '', 'jacommenton', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommenton.xml', ''),
(128, 4, 0, 0, 'JA Content Extra Fields for Joomla 1.6', '', 'jacontentextrafields', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml', ''),
(129, 4, 0, 0, 'JA Disqus Debate Echo plugin for Joomla 1.6.x', '', 'jadisqus_debate_echo', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml', ''),
(130, 4, 0, 0, 'JA System Google Map plugin for Joomla 1.6.x', '', 'jagooglemap', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagooglemap.xml', ''),
(131, 4, 0, 0, 'JA Google Translate plugin for Joomla 1.6.x', '', 'jagoogletranslate', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml', ''),
(132, 4, 0, 0, 'JA Highslide plugin for Joomla 1.6.x', '', 'jahighslide', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jahighslide.xml', ''),
(133, 4, 0, 0, 'JA K2 Search Plugin for Joomla 2.5', '', 'jak2_filter', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_filter.xml', ''),
(134, 4, 0, 0, 'JA K2 Extra Fields Plugin for Joomla 2.5', '', 'jak2_indexing', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml', ''),
(135, 4, 0, 0, 'JA Load module Plugin for Joomla 2.5', '', 'jaloadmodule', 'plugin', 'jaloadmodule', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml', ''),
(136, 4, 0, 0, 'JA System Nrain plugin for Joomla 1.6.x', '', 'janrain', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/janrain.xml', ''),
(137, 4, 0, 0, 'JA Popup plugin for Joomla 1.6', '', 'japopup', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/japopup.xml', ''),
(138, 4, 0, 0, 'JA System Social plugin for Joomla 1.7', '', 'jasocial', 'file', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/jasocial.xml', ''),
(139, 4, 0, 0, 'JA T3 System plugin for Joomla 1.6', '', 'jat3', 'plugin', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/jat3.xml', ''),
(140, 4, 0, 0, 'JA Tabs Plugin for Joomla 2.5', '', 'jatabs', 'plugin', 'jatabs', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/jatabs.xml', ''),
(141, 4, 0, 0, 'JA Typo plugin For Joomla 1.6', '', 'jatypo', 'plugin', 'jatypo', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jatypo.xml', ''),
(142, 4, 0, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16', 'file', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml', ''),
(143, 4, 0, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16_26', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml', ''),
(144, 4, 0, 0, 'JShopping Template for Ja Orisite', '', 'jshopping_theme_orisite', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml', ''),
(145, 4, 0, 0, 'JA Tiris Jshopping theme for J25 & J30', '', 'jshopping_theme_tiris', 'custom', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml', ''),
(146, 4, 0, 0, 'Theme for Jshopping j17', '', 'jshopping_theme_tiris_j17', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml', ''),
(147, 4, 0, 0, 'JA Kranos kunena theme for Joomla 2.5', '', 'kunena_theme_kranos_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml', ''),
(148, 4, 0, 0, 'Kunena Template for JA Mendozite', '', 'kunena_theme_mendozite', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml', ''),
(149, 4, 0, 0, 'JA Mitius Kunena Theme for Joomla 25 ', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml', ''),
(150, 4, 0, 0, 'Kunena theme for JA Nex J2.5', '', 'kunena_theme_nex_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml', ''),
(151, 4, 0, 0, 'Kunena Template for Ja Orisite', '', 'kunena_theme_orisite', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml', ''),
(152, 4, 0, 0, 'Kunena theme for Joomla 2.5', '', 'kunena_theme_social_j16', 'custom', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml', ''),
(153, 4, 0, 0, 'JA Tiris kunena theme for Joomla 2.5', '', 'kunena_theme_tiris_j16', 'custom', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml', ''),
(154, 4, 0, 0, 'JA Jobs Tags module for Joomla 2.5', '', 'mod_ja_jobs_tags', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml', ''),
(155, 4, 0, 0, 'JA Accordion Module for J25 & J30', '', 'mod_jaaccordion', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml', ''),
(156, 4, 0, 0, 'JA Animation module for Joomla 2.5 & 3.0', '', 'mod_jaanimation', 'module', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml', ''),
(157, 4, 0, 0, 'JA Bulletin Module for J25 & J30', '', 'mod_jabulletin', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml', ''),
(158, 4, 0, 0, 'JA Latest Comment Module for Joomla 2.5 & 3.0', '', 'mod_jaclatest_comments', 'module', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml', ''),
(159, 4, 0, 0, 'JA Content Popup Module for J25 & J30', '', 'mod_jacontentpopup', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml', ''),
(160, 4, 0, 0, 'JA Content Scroll module for Joomla 1.6', '', 'mod_jacontentscroll', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml', ''),
(161, 4, 0, 0, 'JA Contenslider module for Joomla 1.6', '', 'mod_jacontentslide', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml', ''),
(162, 4, 0, 0, 'JA Content Slider Module for J25 & J30', '', 'mod_jacontentslider', 'module', '', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslider.xml', ''),
(163, 4, 0, 0, 'JA CountDown Module for J25 & J30', '', 'mod_jacountdown', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml', ''),
(164, 4, 0, 0, 'JA Facebook Activity Module for J25 & J30', '', 'mod_jafacebookactivity', 'module', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml', ''),
(165, 4, 0, 0, 'JA Facebook Like Box Module for J25 & J30', '', 'mod_jafacebooklikebox', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml', ''),
(166, 4, 0, 0, 'JA Featured Employer module for Joomla 2.5', '', 'mod_jafeatured_employer', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml', ''),
(167, 4, 0, 0, 'JA Filter Jobs module for Joomla 2.5', '', 'mod_jafilter_jobs', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml', ''),
(168, 4, 0, 0, 'JA flowlist module for Joomla 2.5 & 3.0', '', 'mod_jaflowlist', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml', ''),
(169, 4, 0, 0, 'JAEC Halloween Module for Joomla 2.5 & 3.0', '', 'mod_jahalloween', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml', ''),
(170, 4, 0, 0, 'JA static module for Joomla 2.5', '', 'mod_jajb_statistic', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml', ''),
(171, 4, 0, 0, 'JA Jobboard Menu module for Joomla 2.5', '', 'mod_jajobboard_menu', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml', ''),
(172, 4, 0, 0, 'JA Jobs Counter module for Joomla 2.5', '', 'mod_jajobs_counter', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml', ''),
(173, 4, 0, 0, 'JA Jobs Map module for Joomla 2.5', '', 'mod_jajobs_map', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml', ''),
(174, 4, 0, 0, 'JA K2 Fillter Module for Joomla 2.5', '', 'mod_jak2_filter', 'module', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml', ''),
(175, 4, 0, 0, 'JA K2 Filter Module for J25 & J30', '', 'mod_jak2filter', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', ''),
(176, 4, 0, 0, 'JA K2 Timeline', '', 'mod_jak2timeline', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml', ''),
(177, 4, 0, 0, 'JA Latest Resumes module for Joomla 2.5', '', 'mod_jalatest_resumes', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml', ''),
(178, 4, 0, 0, 'JA List Employer module for Joomla 2.5', '', 'mod_jalist_employers', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml', ''),
(179, 4, 0, 0, 'JA List Jobs module for Joomla 2.5', '', 'mod_jalist_jobs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml', ''),
(180, 4, 0, 0, 'JA List Resumes module for Joomla 2.5', '', 'mod_jalist_resumes', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml', ''),
(181, 4, 0, 0, 'JA Login module for J25 & J30', '', 'mod_jalogin', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml', ''),
(182, 4, 0, 0, 'JA Masshead Module for J25 & J30', '', 'mod_jamasshead', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml', ''),
(183, 4, 0, 0, 'JA News Featured Module for J25 & J30', '', 'mod_janews_featured', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml', ''),
(184, 4, 0, 0, 'JA Newsflash module for Joomla 1.6.x', '', 'mod_janewsflash', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml', ''),
(185, 4, 0, 0, 'JA Newsmoo module for Joomla 1.6.x', '', 'mod_janewsmoo', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml', ''),
(186, 4, 0, 0, 'JA News Pro Module for J25 & J30', '', 'mod_janewspro', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml', ''),
(187, 4, 0, 0, 'JA Newsticker Module for J25 & J30', '', 'mod_janewsticker', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml', ''),
(188, 4, 0, 0, 'JA Quick Contact Module for J25 & J30', '', 'mod_jaquickcontact', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml', ''),
(189, 4, 0, 0, 'JA Recent Viewed Jobs module for Joomla 2.5', '', 'mod_jarecent_viewed_jobs', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml', ''),
(190, 4, 0, 0, 'JA SideNews Module for J25 & J30', '', 'mod_jasidenews', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasidenews.xml', ''),
(191, 4, 0, 0, 'JA Slideshow Module for J25 & J30', '', 'mod_jaslideshow', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml', ''),
(192, 4, 0, 0, 'JA Slideshow Lite Module for J25 & J30', '', 'mod_jaslideshowlite', 'module', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml', ''),
(193, 4, 0, 0, 'JA Soccerway Module for J25 & J30', '', 'mod_jasoccerway', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml', ''),
(194, 4, 0, 0, 'JA Tab module for Joomla 2.5', '', 'mod_jatabs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml', ''),
(195, 4, 0, 0, 'JA Toppanel Module for Joomla 2.5', '', 'mod_jatoppanel', 'module', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml', ''),
(196, 4, 0, 0, 'JA Twitter Module for J25 & J30', '', 'mod_jatwitter', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', ''),
(197, 4, 0, 0, 'JA Voice: Module List of Voices J17', '', 'mod_javlist_voices', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml', ''),
(198, 4, 0, 0, 'JA Voice: Module Work Flow J17', '', 'mod_javwork_flow', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml', ''),
(199, 4, 0, 0, 'JA Amazon S3 Button Plugin for joomla 2.5 & 3.0', '', 'jaamazons3', 'plugin', 'button', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml', ''),
(200, 4, 0, 0, 'JA Comment Off Plugin for Joomla 2.5 & 3.0', '', 'jacommentoff', 'plugin', 'button', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml', ''),
(201, 4, 0, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.0', '', 'jacommenton', 'plugin', 'button', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', ''),
(202, 4, 0, 0, 'JA Amazon S3 System plugin for joomla 2.5 & 3.0', '', 'plg_jaamazons3', 'plugin', 'plg_jaamazons3', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml', ''),
(203, 4, 0, 0, 'JA Bookmark plugin for J2.5 & J3.0', '', 'plg_jabookmark', 'plugin', 'plg_jabookmark', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jabookmark.xml', ''),
(204, 4, 0, 0, 'JA Comment Plugin for Joomla 2.5 & 3.0', '', 'plg_jacomment', 'plugin', 'plg_jacomment', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jacomment.xml', ''),
(205, 4, 0, 0, 'JA Disqus Debate Echo plugin for J2.5 & J3.0', '', 'debate_echo', 'plugin', 'jadisqus', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_jadisqus_debate_echo.xml', ''),
(206, 4, 0, 0, 'JA Google Storage Plugin for j25 & j30', '', 'plg_jagooglestorage', 'plugin', 'plg_jagooglestorage', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagooglestorage.xml', ''),
(207, 4, 0, 0, 'JA Translate plugin for Joomla 1.6.x', '', 'plg_jagoogletranslate', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagoogletranslate.xml', ''),
(208, 4, 0, 0, 'JA Thumbnail Plugin for J25 & J30', '', 'plg_jathumbnail', 'plugin', 'plg_jathumbnail', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_jathumbnail.xml', ''),
(209, 4, 0, 0, 'JA Tooltips plugin for Joomla 1.6.x', '', 'plg_jatooltips', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatooltips.xml', ''),
(210, 4, 0, 0, 'JA Typo Button Plugin for J25 & J30', '', 'plg_jatypobutton', 'plugin', 'plg_jatypobutton', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatypobutton.xml', ''),
(211, 4, 0, 0, 'JA K2 Filter Plg for J25 & J30', '', 'jak2filter', 'plugin', 'k2', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml', ''),
(212, 4, 0, 0, 'Multi Capcha Engine Plugin for J25 & J30', '', 'captcha_engine', 'plugin', 'multiple', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_multiple_captcha_engine.xml', ''),
(213, 4, 0, 0, 'JA JobBoard Payment Plugin Authorize for Joomla 2.5', '', 'plg_payment_jajb_authorize_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_authorize_25.xml', ''),
(214, 4, 0, 0, 'JA JobBoard Payment Plugin MoneyBooker for Joomla 2.5', '', 'plg_payment_jajb_moneybooker_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_moneybooker_25.xml', ''),
(215, 4, 0, 0, 'JA JobBoard Payment Plugin Paypal for Joomla 2.5', '', 'plg_payment_jajb_paypal_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_paypal_25.xml', ''),
(216, 4, 0, 0, 'JA JobBoard Payment Plugin BankWire for Joomla 2.5', '', 'plg_payment_jajb_wirebank_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_wirebank_25.xml', ''),
(217, 4, 0, 0, 'JA Search Comment Plugin for Joomla J2.5 & 3.0', '', 'jacomment', 'plugin', 'search', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jacomment.xml', ''),
(218, 4, 0, 0, 'JA Search Jobs plugin for Joomla 2.5', '', 'jajob', 'plugin', 'search', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jajob.xml', ''),
(219, 4, 0, 0, 'JA System Comment Plugin for Joomla 2.5 & 3.0', '', 'jacomment', 'plugin', 'system', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacomment.xml', ''),
(220, 4, 0, 0, 'JA Content Extra Fields for Joomla 2.5', '', 'jacontentextrafields', 'plugin', 'system', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacontentextrafields.xml', ''),
(221, 4, 0, 0, 'JA System Google Map plugin for J2.5 & J3.0', '', 'jagooglemap', 'plugin', 'system', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml', ''),
(222, 4, 0, 0, 'JAEC PLG System Jobboad Jomsocial Synchonization', '', 'jajb_jomsocial', 'plugin', 'system', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jajb_jomsocial.xml', ''),
(223, 4, 0, 0, 'JA System Lazyload Plugin for J25 & J30', '', 'jalazyload', 'plugin', 'system', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jalazyload.xml', ''),
(224, 4, 0, 0, 'JA System Nrain Plugin for Joomla 2.5 & 3.0', '', 'janrain', 'plugin', 'system', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_janrain.xml', ''),
(225, 4, 0, 0, 'JA Popup Plugin for J25 & J30', '', 'japopup', 'plugin', 'system', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_japopup.xml', ''),
(226, 4, 0, 0, 'JA System Social Plugin for Joomla 2.5 & 3.0', '', 'jasocial', 'plugin', 'system', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial.xml', ''),
(227, 4, 0, 0, 'JA System Social Feed Plugin for J25 & J30', '', 'jasocial_feed', 'plugin', 'system', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial_feed.xml', ''),
(228, 4, 10001, 0, 'JA T3v2 System Plugin for J25 & J30', '', 'jat3', 'plugin', 'system', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3.xml', ''),
(229, 4, 0, 0, 'JA T3v3 System Plugin', '', 'jat3v3', 'plugin', 'system', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3v3.xml', ''),
(230, 4, 0, 0, 'JA Tabs Plugin for J25 & J30', '', 'jatabs', 'plugin', 'system', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatabs.xml', ''),
(231, 4, 0, 0, 'JA Typo Plugin for J25 & J30', '', 'jatypo', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatypo.xml', ''),
(232, 4, 0, 0, 'T3 System Plugin', '', 't3', 'plugin', 'system', 0, '1.2.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_t3.xml', ''),
(233, 4, 0, 0, 'T3 Blank Template', '', 't3_blank', 'template', '', 0, '1.2.2', '', 'http://update.joomlart.com/service/tracking/j16/t3_blank.xml', ''),
(234, 4, 0, 0, 'JA Teline III Template for Joomla 2.5', '', 'teline_iii', 'template', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/teline_iii.xml', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_user_notes`
--

CREATE TABLE IF NOT EXISTS `g2hvq_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_user_profiles`
--

CREATE TABLE IF NOT EXISTS `g2hvq_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `g2hvq_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `g2hvq_user_usergroup_map`
--

INSERT INTO `g2hvq_user_usergroup_map` (`user_id`, `group_id`) VALUES
(512, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_usergroups`
--

CREATE TABLE IF NOT EXISTS `g2hvq_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `g2hvq_usergroups`
--

INSERT INTO `g2hvq_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_users`
--

CREATE TABLE IF NOT EXISTS `g2hvq_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=513 ;

--
-- Extraindo dados da tabela `g2hvq_users`
--

INSERT INTO `g2hvq_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(512, 'Super User', 'admin', 'cesar@geosapiens.com.br', '98d7c1937d37088dfdb1904fdd4da98a:fZxtTsTIOUjWxaySygHP4GGE5SJCiW2x', 'deprecated', 0, 1, '2013-04-17 12:45:30', '2013-04-17 12:45:50', '0', '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_viewlevels`
--

CREATE TABLE IF NOT EXISTS `g2hvq_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `g2hvq_viewlevels`
--

INSERT INTO `g2hvq_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `g2hvq_weblinks`
--

CREATE TABLE IF NOT EXISTS `g2hvq_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
