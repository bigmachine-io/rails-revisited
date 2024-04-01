require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "should create invoice" do
    visit invoices_url
    click_on "New invoice"

    fill_in "Billing address", with: @invoice.billing_address
    fill_in "Billing city", with: @invoice.billing_city
    fill_in "Billing country", with: @invoice.billing_country
    fill_in "Billing postal code", with: @invoice.billing_postal_code
    fill_in "Billing state", with: @invoice.billing_state
    fill_in "Customer", with: @invoice.customer_id
    fill_in "Invoice date", with: @invoice.invoice_date
    fill_in "Total", with: @invoice.total
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "should update Invoice" do
    visit invoice_url(@invoice)
    click_on "Edit this invoice", match: :first

    fill_in "Billing address", with: @invoice.billing_address
    fill_in "Billing city", with: @invoice.billing_city
    fill_in "Billing country", with: @invoice.billing_country
    fill_in "Billing postal code", with: @invoice.billing_postal_code
    fill_in "Billing state", with: @invoice.billing_state
    fill_in "Customer", with: @invoice.customer_id
    fill_in "Invoice date", with: @invoice.invoice_date
    fill_in "Total", with: @invoice.total
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "should destroy Invoice" do
    visit invoice_url(@invoice)
    click_on "Destroy this invoice", match: :first

    assert_text "Invoice was successfully destroyed"
  end
end
