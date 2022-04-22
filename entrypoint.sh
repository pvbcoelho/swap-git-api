#!/bin/sh
export MIX_ENV=$MIX_ENV
export APPSIGNAL_BUILD_FOR_MUSL=1

echo "running environment: $MIX_ENV"

# Waiting postgres esperando data base subir
while ! pg_isready -d "$DATABASE_URL"
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create database if not exist
mix ecto.create

# Migration
mix ecto.migrate
mix run priv/repo/seeds.exs

# Start Phenix
mix phx.server