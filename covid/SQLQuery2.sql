Select *
From portfoliop.dbo.Sheet1$
Where continent is not null
order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, population
from portfoliop.dbo.Sheet1$
Where continent is not null
order by 1,2

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from portfoliop.dbo.Sheet1$
Where continent is not null
order by 1,2

Select Location, date, total_cases, population, (total_cases/population)*100 as InfectiousRate
from portfoliop.dbo.Sheet1$
--where location = 'Romania'
Where continent is not null
order by 1,2

Select Location, MAX(total_cases) as HighestInfectionCount, population, MAX(total_cases/population)*100 as PercentPopulationInfected
from portfoliop.dbo.Sheet1$
--where location = 'Romania'
Where continent is not null
Group by location, population
order by PercentPopulationInfected DESC

Select Location, date, population, MAX(total_cases) as HighestInfectionCount,  MAX(total_cases/population)*100 as PercentPopulationInfected
from portfoliop.dbo.Sheet1$
--where location = 'Romania'
Group by location, population, date
order by PercentPopulationInfected DESC

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from portfoliop.dbo.Sheet1$
--where location = 'Romania'
Where continent is not null
group by location
order by TotalDeathCount DESC

Select continent, SUM(cast(total_deaths as int)) as TotalDeathCount
from portfoliop.dbo.Sheet1$
--where location = 'Romania'
Where continent is not null
group by continent
order by TotalDeathCount DESC


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from portfoliop.dbo.Sheet1$
Where continent is not null
order by 1,2

create view deaths as
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from portfoliop.dbo.Sheet1$
Where continent is not null
