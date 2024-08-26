import { DatabaseSchema } from './types';
import { fetchSchemaJson as fetchPostgresSchemaJson } from './postgresConnector';
import { fetchSchemaJson as fetchMssqlSchemaJson } from './mssqlConnector';
import { fetchSchemaJson as fetchMysqlSchemaJson } from './mysqlConnector';
import { fetchSchemaJson as fetchSnowflakeSchemaJson } from './snowflakeConnector';

const fetchSchemaJson = async (connection: string, databaseType: string): Promise<DatabaseSchema> => {
  switch (databaseType) {
    case 'postgres':
      return fetchPostgresSchemaJson(connection);
    case 'mssql':
      return fetchMssqlSchemaJson(connection);
    case 'mysql':
      return fetchMysqlSchemaJson(connection);
    case 'snowflake':
      return fetchSnowflakeSchemaJson(connection);
    default:
      throw new Error(`Unsupported database type: ${databaseType}`);
  }
};

export {
  fetchSchemaJson,
};
