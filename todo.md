# Git repository management
How to manage :
- external project Counter defined in project A and external project Cntr defined in project both referencing the same project?
- 2 external projects referencing on the same git repo but not same version?  
- 2 external projects referencing on the same git repo, same version, but diffenrent names ex: tag V1 and #aersbdbrh?
- 2 external projects referencing the same project but with different git urls (ex: https vs ssh, a fork with a clone)

# Package name 
Should we use raw package names (e.g. *Counter-Core*) or scoped package names (e.g. *Counter::Core*)?
Raw package names imply having unique names for all packages whereas scoped package names only imply unique names in project names and for packages part of the project.
