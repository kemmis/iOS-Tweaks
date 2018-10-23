%hook Post

- (bool)isHidden {	
	if([self isKindOfClass:[%c(AdPost) class]]){
		return 1;
	}
	return %orig;
}

%end
