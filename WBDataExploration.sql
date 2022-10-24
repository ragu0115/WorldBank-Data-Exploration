Select *
From PortfolioProject.dbo.Indicators

-- Cleaning Data
-- Remove extra rows of NULL values from Table 

DELETE FROM Indicators Where [Country Name] is NULL

-- Remove unnecessary columns 

ALTER TABLE Indicators
Drop column [Country Code] 

ALTER TABLE Indicators
Drop column [Population total]

ALTER TABLE Indicators
Drop column [Forest Area]

ALTER TABLE Indicators
Drop column [Employers, total]

-- Exploratory Data Analysis

-- Looking at Countries GDP and the Percent Amount of GDP used in Health Expenditure

Select [Country Name], [GDP], [Current health expenditure]
From Indicators
Order by 3 DESC

-- Looking at Country Population Density and Growth

Select [Country Name], [Population Growth], [Population Density] 
From Indicators
Order by 3 DESC

-- Looking at Country CO2 Emissions vs GDP and the resulting effect on Population Growth

Select [Country Name], [CO2 Emissions], [GDP], [Population Growth]
From Indicators
Order by 2 DESC
-- It seems that high CO2 Emissions leads to lower Population Growth

-- Looking at Country GDP vs CO2 Emissions and the resulting effect on Population Growth

Select [Country Name], [GDP], [CO2 Emissions], [Population Growth]
From Indicators
Order by 2 DESC
-- It seems once again that high GDP leads to lower Population Growth and it is increasingly clear that GDP and CO2 Emissions are positively correlated.
-- A high GDP means most likely the country also has high CO2 emissions

-- Looking at Country Job Employment Types

-- Ordered by Agriculture Employment
Select [Country Name], [Employment in Agriculture], [Employment in Services], [Employment in Industry]
From Indicators
Order by 2 desc
-- Countries in Africa seem to have most of their labor force in Agriculture

-- Ordered by Service Employment
Select [Country Name], [Employment in Agriculture], [Employment in Services], [Employment in Industry]
From Indicators
Order by 3 desc
-- Luxembourg has the most employment in Service

-- Ordered by Industry Employment
Select [Country Name], [Employment in Agriculture], [Employment in Services], [Employment in Industry]
From Indicators
Order by 4 desc
-- Countries part of the UAE and surrounding areas such as Bahrain have most of their employment in Industry

-- Looking at Country Inflation vs GDP

Select [Country Name], [Inflation], [GDP]
From Indicators
Order by 2 desc
-- Countries with High Inflation do not have a high Country GDP

-- Looking at Country Electricity Access vs GDP

Select [Country Name], [Access to Electricity], [GDP]
From Indicators
Order by 3
-- It seems that there is a slight positive relationship between these two variables

-- Create Tables

Select [Country Name], [GDP], [Current health expenditure]
Into HealthExpend
From Indicators;

Select [Country Name], [CO2 Emissions], [GDP], [Population Growth]
Into CO2andGDPvsPop
From Indicators

Select [Country Name], [Employment in Agriculture], [Employment in Services], [Employment in Industry]
Into EmploymentTypes
From Indicators

Select [Country Name], [Inflation], [GDP]
Into InflationvsGDP
From Indicators

Select [Country Name], [Access to Electricity], [GDP]
Into ElectricvsGDP
From Indicators
