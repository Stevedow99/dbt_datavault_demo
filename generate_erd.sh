#!/bin/sh

dbt compile \
  && dbt docs generate \
  && dbterd run -s "wildcard:*hub_*" -s "wildcard:*link_*" -s "wildcard:*sat_*" \
  && dbdocs build --project=dbt_datavault_demo ./target/output.dbml
