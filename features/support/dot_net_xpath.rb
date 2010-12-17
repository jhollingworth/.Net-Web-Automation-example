require 'xpath'

module XPath
  module HTML
    def locate_field(xpath, locator)
      locate_field = xpath[attr(:id).contains(locator) | attr(:name).contains(locator) | attr(:id).equals(locator) | attr(:name).equals(locator) | attr(:id).equals(anywhere(:label)[string.n.is(locator)].attr(:for))]
      locate_field += descendant(:label)[string.n.is(locator)].descendant(xpath)
    end
  end
end
