%hook ISCertificate

-(int)isValid {
    return 0x1;
}

%end

%hook ISURLBag

-(void)loadFromDictionary:(NSDictionary*)dict returningError:(NSError**)error {
    NSLog(@"bag load! -> %@", dict);
    return;
}

%end

%hook ISURLOperation
-(BOOL)_isTrustExtendedValidation:(id)secTrust {
    return YES; // override it lol
}
%end
