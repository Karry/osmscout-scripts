# OSM Scout scripts

Collection of scripts that helps me build [maps for OSM Scout](https://osmscout.karry.cz/).

It contains some hardcoded paths or server domains. 
It is not possible to use as it. You should modify paths 
and install dependencies before first usage.

## Map languages

New databases can be initialized with `web/database.sql`. On an existing
database, create the `languages` table using its definition in that file, then
import `web/languages.sql` (for example, `mysql osmscout < web/languages.sql`).
Re-importing the seed updates the listed estimates without deleting other rows.

The seed contains rough estimates for common languages in map areas, not
measurements of OSM names or complete census data. Values may not add up to
one. Maintain them by map ID independently of map versions. `latest.php`
returns a `languages` object on each map, mapping language codes to numeric
prevalence values; an empty object means no data is available. Directory
entries do not have this field.
