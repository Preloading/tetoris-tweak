%hook ISCertificate

-(int)isValid {
    return 0x1;
}

%end

// %hook ISURLBag

// -(void)loadFromDictionary:(NSDictionary*)dict returningError:(NSError**)error {
//     NSLog(@"bag load! -> %@", dict);
//     %orig;
//     return;
// }

// %end

%hook ISURLOperation
-(BOOL)_isTrustExtendedValidation:(id)secTrust {
    return YES; // override it lol
}
%end

%hook ISCertificate 

-(BOOL)checkData:(id)data againstSignature:(id)sig {
    return YES;
}

%end

%hook ISURLBag

-(BOOL)urlIsTrusted:(id)url {
    NSLog(@"trusted -> %@", [self valueForKey:@"_dictionary"]);
    return YES;
}

%end