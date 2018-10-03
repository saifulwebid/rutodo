Sequel.migration do
  up do
    alter_table(:todos) do
      set_column_not_null :title
      set_column_not_null :done
      set_column_default :done, false
    end
  end

  down do
    alter_table(:todos) do
      set_column_null :title
      set_column_null :done
      set_column_default :done, nil
    end
  end
end
