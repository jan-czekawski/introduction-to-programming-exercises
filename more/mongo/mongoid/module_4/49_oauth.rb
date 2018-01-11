# OAuth 2

# OAuth stands for "Open Authorization"
# Open standard protocol that provides simple and secure authorization for different
# types of apps

# Allows providers to give access to users without any exchange of credentials

# Authorization framework that enables apps to get limited access to suer accounts
# on http service like FB, GitHub, TT etc.

# Problems with Password Approach:

# Users have to share credentials
# Not secure and intrusive
# Hard to maintain when you authorize many apps(change password at provider - eg FB - clients need to be updated)


# OAuth 2 approach
# secure - no passwords are exchanged; uses tokens; allows providers to give access to users without any exchange of credentials

# OAuth 2.0 is the next evolution of the OAuth protocol which was originally created in late 2006

# ASSEMBLY
# Core Setup
# create new Rails app
# rails new oauth_movies
# cd oauth_movies

# add gems
# mongoid; httparty

# integrate mongoid
# rails g mongoid:config
