require 'array_utilities'
require 'faker'
require 'benchmark'

describe 'ArrayUtilities' do
  include ArrayUtilities


  it 'eliminates duplicates' do
    source_array = ['one@test.com', 'one@test.com', 'two@test.com', 'three@test.com', 'three@test.com']
    deduped_array = eliminate_duplicates(source_array)

    expect(deduped_array.length).to eq(3)
    expect(deduped_array).to_not eq(source_array)
    expect(deduped_array).to eq(['one@test.com', 'two@test.com', 'three@test.com'])
  end


  it 'does not modify source array' do
    source_array = ['one@test.com', 'one@test.com', 'two@test.com', 'three@test.com', 'three@test.com']
    deduped_array = eliminate_duplicates(source_array)
    expect(source_array).to eq(['one@test.com', 'one@test.com', 'two@test.com', 'three@test.com', 'three@test.com'])
  end


  it 'results in deduped array with same item order as the source array' do
    source_array = ['one@test.com', 'one@test.com', 'two@test.com', 'three@test.com', 'three@test.com']
    deduped_array = eliminate_duplicates(source_array)
    expect(source_array.uniq).to eq(deduped_array)
  end

  it 'processes 100,000 item array, with 50% duplicates in < 1 second' do
    email_list = []
    list = []
    1.upto(50_000) { list << Faker::Internet.unique.email }
    email_list << list
    email_list << list
    email_list.flatten!
    email_list.shuffle!

    deduped_email_list = nil
    expect(email_list.uniq.length).to eq(50_000)
    running_time = Benchmark.realtime { deduped_email_list = eliminate_duplicates(email_list) }
    expect(deduped_email_list.length).to eq(50_000)

    puts ""
    puts '*'*80
    puts "Running time for eliminate_duplicates: %0.3f seconds" % running_time
    puts '*'*80

    expect(running_time).to be < 1.0
  end

end


