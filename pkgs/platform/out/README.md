Local package used to test migration.

Files with legacy API uses are copied into `out/migration_test/`
to test `dart fix`. 
Uses a separate package to make sure the analyzer recognizes deprecations.
