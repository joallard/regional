# Regional
**Regional** tells you if a certain location is within a given
territory.

For now, territories are defined with Canadian postal codes only.


## Installation

Add this line to your application's Gemfile:

    gem 'regional'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regional

## Usage

```rb
plateau = Regional::Zone.new "H2H, H2J, H2T" 
plateau.cover? "H2J 1L8"  #=> true
plateau.cover? "H3A 1A1"  #=> false
```
