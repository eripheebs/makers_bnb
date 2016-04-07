require './app/models/email'

describe Email do
  subject(:email) { described_class.new }
  let(:recipient) { 'jazzy@jazzhands.com' }
  let(:subject) { double :subject }
  let(:body) { double 'hi there pals!', length: 14 }

  describe '#send_mail' do
    it '> should send an email when called' do
      expect(Pony).to receive(:deliver) do |mail|
        expect(mail.to).to eq([ 'jazzy@jazzhands.com' ])
      end
      email.send_mail(recipient, subject, body)
    end
  end
end
