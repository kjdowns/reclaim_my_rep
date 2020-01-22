
# Reclaim My Rep

Reclaim My Rep is a web application which allows citizens to keep track of their elected representatives. Once a citizen creates an account, the tool allows them to find and keep track of their elected representatives. It also gives them the ability to track contacts they have had, whether or not they have received a response, and if they feel the response was meaningful.

The Google Civil Information API is used in order to automatically add the two Senators and one Congressperson that represents the address they specify. 

The tool allows citizens to be more engaged in their representation, and more informed when they go to the ballot box.

## Installation

If bundler is installed, you can simply run `bundle` in order to install all dependencies and gems.

If bundle is not installed, simply use `gem install bundler` and then `bundle` to ensure all necessary gems and dependencies are installed.

You can use `shotgun` in order to host the web application locally, the default address being localhost:9393.

## Usage

After signing up and loggin into the site, you have the ability to add representatives to your account. This can be done manually or automatically with the Find My Rep button. You can also keep track of contacts you have had with your rep. These include a title and description box, as well as checkboxes for marking if a response was received and if that response was meaningful to you. These can be viewed per Rep or all together, and both Reps and Contacts can be Created, Read, Updated, and Destroyed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'kdowns'/dbd_archive. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DbdArchive project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kjdowns/reclaim_my_rep/blob/master/CODE_OF_CONDUCT.md).