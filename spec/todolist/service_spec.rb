RSpec.describe Todolist::Service do
  let(:db_service) { Object.new }
  let(:service) { described_class.new(service: db_service) }
  let(:valid_todo) { Todolist::Todo.new(1, 'A valid todo', nil, :pending) }
  let(:invalid_todo) { Todolist::Todo.new(2, nil, nil, :pending) }

  describe '#add' do
    before(:each) {
      # mock Database::TodoService
      allow(db_service).to receive(:insert) { Todolist::Todo.new }
    }

    context 'valid todo' do
      it {
        expect(db_service).to receive(:insert)
        expect(service.add('Title', nil)).to be_truthy
      }
    end

    context 'invalid todo' do
      it {
        expect(db_service).to_not receive(:insert)
        expect(service.add(nil, nil)).to be false
      }
    end
  end

  describe '#edit' do
    before(:each) {
      # mock Database::TodoService
      allow(db_service).to receive(:update) { Todolist::Todo.new }
    }

    context 'valid todo' do
      it {
        expect(db_service).to receive(:update)
        expect(service.edit(valid_todo)).to be_truthy
      }
    end

    context 'invalid todo' do
      it {
        expect(db_service).to_not receive(:update)
        expect(service.edit(invalid_todo)).to be false
      }
    end
  end

  describe '#mark_as_done' do
    before(:each) {
      # mock Database::TodoService
      allow(db_service).to receive(:update)
    }

    it {
      expect(service).to receive(:edit)

      service.mark_as_done(valid_todo)
      expect(valid_todo.status).to eq(:finished)
    }
  end
end
