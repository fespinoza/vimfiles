require 'new_hash_syntax'

include NewHashSyntax

describe 'New Hash Syntax' do
  replace_cases = {
    'old hash style' => {
      from: 'option :key => :value',
      to: 'option key: :value'
    },
    'old hash style with no spaces' => {
      from: 'option :key=>:value',
      to: 'option key: :value'
    },
    'old nested hashes' => {
      from: 'option :key => { :value => :nested_value }',
      to: 'option key: { value: :nested_value }'
    }
  }

  do_not_replace_cases = {
    'old hash with strings' => 'option "key" => "value"',
    'new hash syntax' => 'option key: :value'
  }

  replace_cases.each_pair do |case_name, values|
    it "correctly replaces #{case_name}" do
      expect(NewHashSyntax.update_hashes(values[:from])).to eq(values[:to])
    end
  end

  do_not_replace_cases.each_pair do |case_name, value|
    it "does not replace #{case_name}" do
      expect(NewHashSyntax.update_hashes(value)).to eq(value)
    end
  end
end
