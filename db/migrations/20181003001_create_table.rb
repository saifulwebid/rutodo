Sequel.migration do
  change do
    create_table(:todos) do
      primary_key :id
      String :title
      String :description
      TrueClass :done
    end
  end
end
