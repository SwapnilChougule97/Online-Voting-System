CREATE DATABASE evoting;

USE evoting;

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL
);

insert  into `admin`(`username`,`password`) values ('admin','admin');



DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `pname` varchar(200) default NULL,
  `cid` varchar(200) default NULL,
  `fname` varchar(200) default NULL,
  `lname` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `mobile` varchar(200) default NULL,
  `gender` varchar(200) default NULL,
  `address` varchar(2000) default NULL,
  `aadhar` varchar(200) default NULL,
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `constituency` varchar(200) default NULL,
  `image` longblob,
  `status` varchar(200) default NULL
); 



DROP TABLE IF EXISTS `party`;

CREATE TABLE `party` (
  `pid` varchar(2000) default NULL,
  `pname` varchar(200) default NULL,
  `pemail` varchar(200) default NULL,
  `pmobile` varchar(200) default NULL,
  `paddress` varchar(200) default NULL,
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `image` longblob,
  `status` varchar(200) default NULL
);

DROP TABLE IF EXISTS `voter`;

CREATE TABLE `voter` (
  `state` varchar(200) default NULL,
  `district` varchar(200) default NULL,
  `vid` varchar(200) NOT NULL,
  `fname` varchar(200) default NULL,
  `lname` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `mobile` varchar(200) default NULL,
  `gender` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `aadhar` varchar(200) default NULL,
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `constituency` varchar(200) default NULL,
  `image` longblob,
  `status` varchar(200) default NULL,
  PRIMARY KEY  (`vid`)
);


DROP TABLE IF EXISTS `votes`;

CREATE TABLE `votes` (
  `pname` varchar(200) default NULL,
  `cid` varchar(200) default NULL,
  `cname` varchar(200) default NULL,
  `constituency` varchar(200) default NULL,
  `vname` varchar(200) default NULL
);

