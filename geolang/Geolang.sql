/*
Created: 08.04.2024
Modified: 21.04.2024
Model: geolang
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table language

CREATE TABLE [language]
(
 [lang_ID] Nchar(20) NOT NULL,
 [lang_name] Nchar(30) NOT NULL,
 [morph_type] Nchar(10) NOT NULL,
 [synt_type] Nvarchar(10) NOT NULL,
 [fam_name] Nchar(30) NULL,
 [num_speakers] Int NULL
)
go

-- Create indexes for table language

CREATE INDEX [IX_Relationship3] ON [language] ([fam_name])
go

-- Add keys for table language

ALTER TABLE [language] ADD CONSTRAINT [PK_language] PRIMARY KEY ([lang_ID],[lang_name])
go

-- Table lang_family

CREATE TABLE [lang_family]
(
 [fam_name] Nchar(30) NOT NULL
)
go

-- Add keys for table lang_family

ALTER TABLE [lang_family] ADD CONSTRAINT [PK_lang_family] PRIMARY KEY ([fam_name])
go

-- Table country

CREATE TABLE [country]
(
 [country_ID] Int NOT NULL,
 [country_name] Nvarchar(30) NOT NULL,
 [location] Nvarchar(50) NOT NULL
)
go

-- Add keys for table country

ALTER TABLE [country] ADD CONSTRAINT [PK_country] PRIMARY KEY ([country_ID],[country_name])
go

-- Table countries_languages

CREATE TABLE [countries_languages]
(
 [country_ID] Int NOT NULL,
 [country_name] Nvarchar(30) NOT NULL,
 [lang_ID] Nchar(20) NOT NULL,
 [lang_name] Nchar(30) NOT NULL
)
go

-- Add keys for table countries_languages

ALTER TABLE [countries_languages] ADD CONSTRAINT [PK_countries_languages] PRIMARY KEY ([country_ID],[country_name],[lang_ID],[lang_name])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [language] ADD CONSTRAINT [Languages in Family] FOREIGN KEY ([fam_name]) REFERENCES [lang_family] ([fam_name]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [countries_languages] ADD CONSTRAINT [languages spoken in a country] FOREIGN KEY ([country_ID], [country_name]) REFERENCES [country] ([country_ID], [country_name]) ON UPDATE CASCADE ON DELETE NO ACTION
go



ALTER TABLE [countries_languages] ADD CONSTRAINT [countries a language is spoken in] FOREIGN KEY ([lang_ID], [lang_name]) REFERENCES [language] ([lang_ID], [lang_name]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




