require 'takeaway'

RSpec.describe Takeaway do

  before(:each) do
    @menu = double('menu')
    @order = double('order')
    @dish = double(:dish)
    @text = double(:text)
    allow(@menu).to receive(:display).and_return({ @dish => 10 })
    allow(@order).to receive(:display).and_return("#{@dish} x 2 = £20")
    allow(@order).to receive(:take).and_return([[@dish, 2]])
    allow(@order).to receive(:details).and_return([[@dish, 2, 10]])
    allow(@text).to receive(:send).and_return(true)
    @takeaway = Takeaway.new(@menu, @order, @text)
  end

  it { is_expected.to respond_to(:read_menu) }
  it { is_expected.to respond_to(:order).with(2).arguments }
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:basket_summary) }
  it { is_expected.to respond_to(:basket_summary) }
  it { is_expected.to respond_to(:checkout) }

  it "can display a list of dishes with prices" do
    expect(@takeaway.read_menu).to eq({ @dish => 10 })
  end

  it "can order any dish in various quantities" do
    @takeaway.order(@dish, 2)
    expect(@takeaway.basket_summary).to eq("#{@dish} x 2 = £20")
  end

  it "can calculate the total of the order" do
    @takeaway.order(@dish, 2)
    expect(@takeaway.total).to be(20)
  end

  it "raises an error if someone tries to checkout with the wrong sum" do
    @takeaway.order(@dish, 2)
    expect { @takeaway.checkout(21) }.to raise_error "Please enter the exact sum"
  end

  it "calls on @text.send to send the message if #checkout is passed the right sum" do
    @takeaway.order(@dish, 2)
    expect(@takeaway.checkout(20)).to eq(true)
  end
end
