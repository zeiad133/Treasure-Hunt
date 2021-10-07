# frozen_string_literal: true

module MysqlCharsetUpdater
  def alter_database_and_tables_charsets(charset = default_charset, collation = default_collation)
    case connection.adapter_name
    when 'Mysql2'
      execute "ALTER DATABASE `#{connection.current_database}` CHARACTER SET #{charset} COLLATE #{collation}"

      connection.tables.each do |table|
        execute "ALTER TABLE `#{table}` CONVERT TO CHARACTER SET #{charset} COLLATE #{collation};"
      end
    else
      # OK, not quite irreversible but can't be done if there's not
      # the code here to support it...
      raise ActiveRecord::IrreversibleMigration, 'Migration error: Unsupported database adapter'
    end
  end

  def default_charset
    case connection.adapter_name
    when 'Mysql2'
      execute("show variables like 'character_set_server'").fetch_hash['Value']
    end
  end

  def default_collation
    case connection.adapter_name
    when 'Mysql2'
      execute("show variables like 'collation_server'").fetch_hash['Value']
    end
  end

  def connection
    ActiveRecord::Base.connection
  end
end
