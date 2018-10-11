RSpec.describe Rutodo::Todo do
  describe '#mark_as_done!' do
    context 'read-only and read-write attributes' do
      todo = described_class.new

      it 'should raise NoMethodError on setting read-only attributes' do
        expect{ todo.id = 1 }.to raise_error(NoMethodError)
        expect{ todo.status = 1 }.to raise_error(NoMethodError)
      end

      it 'and should success on setting read-write attributes' do
        expect{ todo.title = 1 }.to_not raise_error
        expect{ todo.description = 1 }.to_not raise_error
      end
    end

    context 'pending todo' do
      todo = described_class.new(nil, 'Hi!', nil, :pending)
      todo.mark_as_done!

      it{ expect(todo.status).to eq(:finished) }
    end

    context 'finished todo' do
      todo = described_class.new(nil, 'Hi!', nil, :finished)
      todo.mark_as_done!

      it{ expect(todo.status).to eq(:finished) }
    end
  end

  describe '#valid?' do
    context 'valid todo' do
      todo = described_class.new(nil, 'Hi!', nil, :pending)

      it{ expect(todo.valid?).to eq(true) }
    end

    context 'todo with nil title' do
      todo = described_class.new(nil, nil, nil, :pending)

      it{ expect(todo.valid?).to eq(false) }
    end

    context 'todo with empty string title' do
      todo = described_class.new(nil, "", nil, :pending)

      it{ expect(todo.valid?).to eq(false) }
    end
  end
end
