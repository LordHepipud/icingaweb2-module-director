CREATE INDEX icinga_service_set_host ON icinga_service_set (host_id);

ALTER TABLE icinga_service_set
  ADD CONSTRAINT icinga_service_set_host FOREIGN KEY (host_id)
    REFERENCES icinga_host (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

CREATE INDEX icinga_service_service_set ON icinga_service (service_set_id);

ALTER TABLE icinga_service
  ADD CONSTRAINT icinga_service_service_set FOREIGN KEY (service_set_id)
    REFERENCES icinga_service_set (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

INSERT INTO director_schema_migration
  (schema_version, migration_time)
  VALUES (XX, NOW());
