require 'csv'

desc 'Import teams from csv file'
task :import => [:environment] do

  customers = "data/customers.csv"

  CSV.foreach(customers, :headers => true) do |row|
    customer = Customer.create!(row.to_hash)
    puts "Created Customer ID #{customer.id}: #{customer.first_name} #{customer.last_name}"
  end

  merchants = "data/merchants.csv"

  CSV.foreach(merchants, :headers => true) do |row|
    merchant = Merchant.create!(row.to_hash)
    puts "Created Merchant ID #{merchant.id}: #{merchant.name}"
  end

  invoices = "data/invoices.csv"

  CSV.foreach(invoices, :headers => true) do |row|
    invoice = Invoice.create!(row.to_hash)
    puts "Created Invoice ID #{invoice.id}: #{invoice.status}"
  end

  items = "data/items.csv"

  CSV.foreach(items, :headers => true) do |row|
    item = Item.create!(row.to_hash)
    puts "Created Item ID #{item.id}: #{item.name}"
  end

  invoice_items = "data/invoice_items.csv"

  CSV.foreach(invoice_items, :headers => true) do |row|
    invoice_item = InvoiceItem.create!(row.to_hash)
    puts "Created Invoice Item ID #{invoice_item.id}"
  end

  transactions = "data/transactions.csv"

  CSV.foreach(transactions, :headers => true) do |row|
    transaction = Transaction.create!(row.to_hash)
    puts "Created Transaction ID #{transaction.id}: #{transaction.result}"
  end

end
